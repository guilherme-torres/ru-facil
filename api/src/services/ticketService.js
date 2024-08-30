const QRCode = require("qrcode")
const uuid = require("uuid")
const jwt = require("jsonwebtoken")

class TicketService {
    constructor(ticketRepository) {
        this.ticketRepository = ticketRepository
    }

    async create(userId) {
        const activeTickets = await this.ticketRepository.countActiveTickets(userId)
        const activeTicketsCount = activeTickets[0].count

        if (activeTicketsCount >= 5) throw new Error("You have reached the maximum limit of active tickets allowed.")

        const id = uuid.v4()
        const token = jwt.sign({ id }, process.env.ACCESS_TOKEN_SECRET, {})
        const ticket = {
            id,
            userId,
            qrcodeImageURL: await QRCode.toDataURL(token)
        }
        await this.ticketRepository.create(ticket)
        return ticket
    }

    async listAll(userId) {
        return await this.ticketRepository.listAll(userId)
    }

    async validateTicket(token) {
        try {
            const decoded = jwt.verify(token, process.env.ACCESS_TOKEN_SECRET)
            const ticketId = decoded.id
            const ticket = await this.ticketRepository.findById(ticketId)
            if (!ticket) throw new Error("Ticket not found.")
            if (ticket.used) throw new Error("Ticket has already been used.")
            ticket.used = true
            await this.ticketRepository.update(ticketId, { used: true })
            return ticket
        } catch (error) {
            throw new Error(error.message)
        }
    }

    async findById(id) {
        return await this.ticketRepository.findById(id)
    }
}

module.exports = TicketService