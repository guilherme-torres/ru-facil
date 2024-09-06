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
        const tokens = await this.authService.login(request.body)
        if (!tokens) return response.status(401).json({
            status: "error",
            message: "Invalid credentials. Please check your username and password and try again.",
            code: 401
        })
        return response.status(200).json(tokens)
    }

    async refreshAccessToken(request, response) {
        const { refreshToken } = request.cookies
        if (!refreshToken) return response.status(401).json({
            status: "error",
            message: "Refresh token missing. Please log in again.",
            code: 401
        })
        const accessToken = await this.authService.refreshAccessToken(refreshToken)
        if (!accessToken) return response.status(401).json({
            status: "error",
            message: "Invalid or expired refresh token. Please log in again.",
            code: 401
        })
        return response.status(200).json({ accessToken })
    }

    async verifyEmail(request, response) {
        try {
            const { token } = request.query
            await this.authService.verifyEmail(token)
            return response.sendStatus(200)
        } catch (error) {
            return response.status(400).json({
                status: "error",
                message: error.message,
                code: 400
            })
        }
    }
}

module.exports = AuthController