const express = require("express")
const routes = require("./routes")
const jwt = require("jsonwebtoken")

function verifyToken(request, response, next) {
    if (request.path === "/api/register" || request.path === "/api/login") return next()
    const authorization = request.headers["authorization"]
    if (!authorization) return response.status(401).json({
        status: "error",
        message: "Missing JWT token. Please provide a valid JWT token in the Authorization header to access this resource.",
        code: 401
    })
    const token = authorization.replace("Bearer ", "")
    jwt.verify(token, process.env.JWT_SECRET, (error, decoded) => {
        if (error) return response.status(401).json({
            status: "error",
            message: "Invalid JWT token. Please provide a valid JWT token in the Authorization header to access this resource.",
            code: 401
        })

        console.log("token válido: ", decoded)
        next()
    })
}

const app = express()
app.use(express.json())
app.use(verifyToken)
app.use("/api", routes)

app.listen(3333)