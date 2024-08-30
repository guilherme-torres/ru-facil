const https = require("https")
const axios = require("axios")
const fs = require("fs")
const path = require("path")

class PixService {
    constructor(ticketRepository) {
        this.ticketRepository = ticketRepository
        this.baseUrl = process.env.NODE_ENV === "production" ? process.env.EFI_BASE_URL_PROD : process.env.EFI_BASE_URL_DEV
        this.agent = null
    }

    async authenticate() {
        const certificateFileName = process.env.NODE_ENV === "production" ? process.env.EFI_CERT_PROD : process.env.EFI_CERT_DEV
        const certificate = fs.readFileSync(path.resolve(__dirname, "..", "..", "certs", certificateFileName))

        const credentials = {
            clientId: process.env.NODE_ENV === "production" ? process.env.EFI_CLIENT_ID_PROD : process.env.EFI_CLIENT_ID_DEV,
            clientSecret: process.env.NODE_ENV === "production" ? process.env.EFI_CLIENT_SECRET_PROD : process.env.EFI_CLIENT_SECRET_DEV
        }

        const data = JSON.stringify({ grant_type: "client_credentials" })
        const dataCredentials = credentials.clientId + ":" + credentials.clientSecret

        const auth = Buffer.from(dataCredentials).toString("base64")

        this.agent = new https.Agent({
            pfx: certificate,
            passphrase: "",
        })

        const config = {
            method: "POST",
            url: `${this.baseUrl}/oauth/token`,
            headers: {
                Authorization: "Basic " + auth,
                "Content-Type": "application/json",
            },
            httpsAgent: this.agent,
            data: data,
        }

        const response = await axios(config)
        return response.data
    }

    async generateCob(amount, userId) {
        if (!amount) throw new Error("The amount parameter must be specified in the request body.")
        if (amount < 1) throw new Error("You must select at least one ticket to proceed.")

        const activeTickets = await this.ticketRepository.countActiveTickets(userId)
        const activeTicketsCount = activeTickets[0].count

        if (activeTicketsCount >= 5) throw new Error("You have reached the maximum limit of active tickets allowed.")

        if (activeTicketsCount + amount > 5) throw new Error("You can have a maximum of 5 active tickets at a time.")

        const { access_token, token_type } = await this.authenticate()

        const total = parseFloat(process.env.TICKET_UNIT_PRICE) * amount

        if (isNaN(total)) throw new Error("Invalid amount value.")

        const data = {
            calendario: {
                expiracao: 3600
            },
            valor: {
                original: total.toFixed(2)
            },
            chave: process.env.PIX_KEY,
            solicitacaoPagador: "Cobrança dos serviços prestados."
        }

        const config = {
            method: "POST",
            url: `${this.baseUrl}/v2/cob`,
            headers: {
                Authorization: token_type + " " + access_token,
                "Content-Type": "application/json",
            },
            httpsAgent: this.agent,
            data: data,
        }

        const response = await axios(config)
        return response.data
    }

    async generatePixQrcode(amount, userId) {
        const { access_token, token_type } = await this.authenticate()
        const { loc } = await this.generateCob(amount, userId)

        const config = {
            method: "GET",
            url: `${this.baseUrl}/v2/loc/${loc.id}/qrcode`,
            headers: {
                Authorization: token_type + " " + access_token,
                "Content-Type": "application/json",
            },
            httpsAgent: this.agent,
        }

        const response = await axios(config)
        return response.data
    }
}

module.exports = PixService