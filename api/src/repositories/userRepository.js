const db = require("../db/database")

class UserRepository {
    async create(userData) {
        return await db("users").insert(userData)
    }

    async listAll() {
        return await db.select("*").from("users")
    }

    async findByEmail(email) {
        return await db.select("*").from("users").where("users.email", email).first()
    }
}

module.exports = UserRepository