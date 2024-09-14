/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
    return knex.schema.createTable("users", table => {
        table.uuid('id').defaultTo(knex.fn.uuid()).primary()
        table.string("name").notNullable()
        table.string("email").unique().notNullable()
        table.string("password").notNullable()
        table.boolean("verified").notNullable().defaultTo(false)
    })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
    return knex.schema.dropTableIfExists("users")
};
