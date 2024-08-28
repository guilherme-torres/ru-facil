const db = require("../db/database")

class TicketRepository {
    async create(ticketData) {
        return await db("tickets").insert(ticketData)
    }
    
    async listAll(userId) {
        return await db.select("*").from("tickets").where("userId", userId)
    }
    
    async findById(id) {
        return await db.select("*").from("tickets").where("id", id).first()
    }

    async update(id, ticketData) {
        return await db("tickets").where("id", id).update(ticketData)
    }

    async delete(id) {
        return await db("tickets").where("id", id).del()
    }

    async countActiveTickets(userId) {
        return await db("tickets")
            .where("userId", userId)
            .andWhere("used", false)
            .count("id as count")
    }
}

module.exports = TicketRepository