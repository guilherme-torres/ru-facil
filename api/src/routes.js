const express = require("express")
const UserService = require("./services/userService")
const UserRepository = require("./repositories/userRepository")
const UserController = require("./controllers/userController")

const userRepository = new UserRepository()
const userService = new UserService(userRepository)
const userController = new UserController(userService)

const routes = express.Router()

routes.post("/register", async (request, response) => await userController.create(request, response))
routes.get("/users", async (request, response) => await userController.listAll(request, response))

module.exports = routes