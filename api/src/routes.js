const express = require("express")
const UserRepository = require("./repositories/userRepository")
const AuthService = require("./services/authService")
const AuthController = require("./controllers/authController")
const UserService = require("./services/userService")
const UserController = require("./controllers/userController")

const userRepository = new UserRepository()
const authService = new AuthService(userRepository)
const authController = new AuthController(authService)
const userService = new UserService(userRepository)
const userController = new UserController(userService)

const routes = express.Router()

routes.post("/register", async (request, response) => await authController.register(request, response))
routes.post("/login", async (request, response) => await authController.login(request, response))
routes.get("/users", async (request, response) => await userController.listAll(request, response))

module.exports = routes