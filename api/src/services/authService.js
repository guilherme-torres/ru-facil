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
        const token = jwt.sign(
            { name: user.name },
            process.env.JWT_SECRET,
            { expiresIn: 300, subject: user.id }
        )
        return token
    }
}

module.exports = AuthService