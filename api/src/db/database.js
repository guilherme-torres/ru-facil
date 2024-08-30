const knex = require("knex")
const knexfile = require("../../knexfile")

const db = knex(process.env.NODE_ENV === "production" ? knexfile.production : knexfile.development)

module.exports = db