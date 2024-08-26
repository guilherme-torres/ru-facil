class UserService {
    constructor(userRepository) {
        this.userRepository = userRepository
    }

    async listAll() {
        return await this.userRepository.listAll()
    }
}

module.exports = UserService