class AuthController {
    constructor(authService) {
        this.authService = authService
    }

    async register(request, response) {
        const user = await this.authService.register(request.body)
        if (!user) return response.status(400).json({
            status: "error",
            message: "Email address already exists.",
            code: 400
        })
        return response.sendStatus(201)
    }

    async login(request, response) {
        const token = await this.authService.login(request.body)
        if (!token) return response.status(401).json({
            status: "error",
            message: "Invalid credentials. Please check your username and password and try again.",
            code: 401
        })
        return response.status(200).json({ token })
    }
}

module.exports = AuthController