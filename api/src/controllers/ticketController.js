class TicketController {
    constructor(ticketService) {
        this.ticketService = ticketService
    }

    async create(request, response) {
        try {
            const ticket = await this.ticketService.create(request.userId)
            return response.status(201).json(ticket)
        } catch (error) {
            return response.status(400).json({
                message: error.message
            })
        }
    }

    async listAll(request, response) {
        const tickets = await this.ticketService.listAll(request.userId)
        return response.status(200).json(tickets)
    }

    async validateTicket(request, response) {
        try {
            const ticket = await this.ticketService.validateTicket(request.body.token)
            return response.status(200).json({
                valid: true
            })
        } catch (error) {
            return response.status(400).json({
                valid: false,
                message: error.message
            })
        }
    }

    async findById(request, response) {
        const ticket = await this.ticketService.findById(request.params.id)
        if (!ticket) return response.status(404).json({
            message: "Ticket not found."
        })
        return response.status(200).json(ticket)
    }
}

module.exports = TicketController