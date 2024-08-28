/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
    return knex.schema.createTable("tickets", table => {
        table.string("id").notNullable().primary()
        table.boolean("used").notNullable().defaultTo(false)
        table.timestamp("created_at").notNullable().defaultTo(knex.fn.now())
        table.text("qrcodeImageURL").notNullable()
        table.uuid("userId")
            .notNullable()
            .references("id")
            .inTable("users")
            .onDelete("CASCADE")
    })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
    return knex.schema.dropTableIfExists("tickets")
};
