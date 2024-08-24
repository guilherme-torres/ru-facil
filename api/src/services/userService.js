const bcrypt = require("bcrypt")

class UserService {
    constructor(userRepository) {
        this.userRepository = userRepository
    }

    async create(userData) {
        const { name, email, password } = userData
        const user = await this.userRepository.findByEmail(email)
        if (user) return null
        const salt = bcrypt.genSaltSync(10)
        const hashedPassword = bcrypt.hashSync(password, salt)
        const newUser = { name, email, password: hashedPassword }
        await this.userRepository.create(newUser)
        return newUser
    }

    async listAll() {
        return await this.userRepository.listAll()
    }
}

module.exports = UserService