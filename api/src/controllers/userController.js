class UserController {
    constructor(userService) {
        this.userService = userService
    }

    async listAll(request, response) {
        const users = await this.userService.listAll()
        return response.status(200).json(users)
    }
}

module.exports = UserController