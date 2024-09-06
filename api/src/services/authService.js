const bcrypt = require("bcrypt")
const jwt = require("jsonwebtoken")
const nodemailer = require("nodemailer")

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
        const newUser = { name, email, password: hashedPassword, verified: false }
        await this.userRepository.create(newUser)
        const emailToken = jwt.sign(
            { email },
            process.env.EMAIL_TOKEN_SECRET,
            { expiresIn: "1h" }
        )
        const transport = nodemailer.createTransport({
            service: process.env.EMAIL_SERVICE,
            auth: {
                type: "OAuth2",
                user: process.env.EMAIL_USER,
                pass: process.env.EMAIL_PASSWORD,
                clientId: process.env.OAUTH_CLIENTID,
                clientSecret: process.env.OAUTH_CLIENT_SECRET,
                refreshToken: process.env.OAUTH_REFRESH_TOKEN,
            },
        })
        const verificationUrl = "http://localhost:3333/api/verify?token=" + emailToken
        const mailOptions = {
            from: process.env.EMAIL_USER,
            to: email,
            subject: "Verifique seu e-mail.",
            html: `<p>Por favor, clique no link para verificar seu e-mail: <a href="${verificationUrl}">${verificationUrl}</a></p>`,
        }
        await transport.sendMail(mailOptions)
        return newUser
    }

    async verifyEmail(token) {
        try {
            const decoded = jwt.verify(token, process.env.EMAIL_TOKEN_SECRET)
            await this.userRepository.updateByEmail(decoded.email, { verified: true })
        } catch (error) {
            throw new Error(error.message)
        }
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