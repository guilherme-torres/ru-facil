const express = require("express")
const routes = require("./routes")
const verifyToken = require("./middlewares/verifyToken")
const cookieParser = require("cookie-parser")

const app = express()
app.use(express.json())
app.use(cookieParser())
app.use(verifyToken)
app.use("/api", routes)

app.listen(3333)