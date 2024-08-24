class UserController {
    constructor(userService) {
        this.userService = userService
    }

    async create(request, response) {
        const user = await this.userService.create(request.body)
        if (!user) return response.status(400).json({ status: "BAD_REQUEST", message: "Email address already exists." })
        return response.sendStatus(201)
    }

    async listAll(request, response) {
        const users = await this.userService.listAll()
        return response.status(200).json(users)
    }
}

module.exports = UserController