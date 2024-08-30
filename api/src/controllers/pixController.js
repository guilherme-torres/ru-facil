class PixController {
    constructor(pixService) {
        this.pixService = pixService
    }

    async generatePixQrcode(request, response) {
        try {
            const { amount } = request.body
            const data = await this.pixService.generatePixQrcode(amount, request.userId)
            return response.status(200).json(data)
        } catch (error) {
            return response.status(400).json({
                status: "error",
                message: error.message,
                code: 400
            })
        }
    }
}

module.exports = PixController