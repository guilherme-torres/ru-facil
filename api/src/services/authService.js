const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")

class AuthService {
    constructor(userRepository) {
        this.userRepository = userRepository
    }

    async register(userData) {
        const { name, email, password } = userData
        const user = await this.userRepository.findByEmail(email)
        if (user) return null
        const salt = bcrypt.genSaltSync(10)
        const hashedPassword = bcrypt.hashSync(password, salt)
        const newUser = { name, email, password: hashedPassword }
        await this.userRepository.create(newUser)
        return newUser
    }

    async login(userData) {
        const { email, password } = userData
        const user = await this.userRepository.findByEmail(email)
        if (!user || !bcrypt.compareSync(password, user?.password)) return null
        const accessToken = jwt.sign(
            { name: user.name },
            process.env.ACCESS_TOKEN_SECRET,
            { expiresIn: "5m", subject: user.id }
        )
        const refreshToken = jwt.sign(
            {}, process.env.REFRESH_TOKEN_SECRET,
            { expiresIn: "15d", subject: user.id }
        )
        return { accessToken, refreshToken }
    }

    async refreshAccessToken(refreshToken) {
        try {
            const decoded = jwt.verify(refreshToken, process.env.REFRESH_TOKEN_SECRET)
            const userId = decoded.sub;
            const user = await this.userRepository.findById(userId)

            if (!user) return null

            const newAccessToken = jwt.sign(
                { name: user.name },
                process.env.ACCESS_TOKEN_SECRET,
                { expiresIn: "5m", subject: user.id }
            )

            return newAccessToken
        } catch (error) {
            return null
        }
    }
}

module.exports = AuthService