const jwt = require("jsonwebtoken")

function verifyToken(request, response, next) {
    if (request.path === "/api/register" || request.path === "/api/login" || request.path === "/api/refresh") return next()
    const authorization = request.headers["authorization"]
if (!authorization) return response.status(401).json({
    status: "error",
        message: "Missing JWT token. Please provide a valid JWT token in the Authorization header to access this resource.",
        code: 401
    })
    const accessToken = authorization.replace("Bearer ", "")
    jwt.verify(accessToken, process.env.ACCESS_TOKEN_SECRET, (error, decoded) => {
        if (error) return response.status(401).json({
            status: "error",
            message: "Invalid or expired JWT token. Please provide a valid JWT token in the Authorization header to access this resource.",
            code: 401
        })
        request.userId = decoded.sub
        next()
    })
}

module.exports = verifyToken