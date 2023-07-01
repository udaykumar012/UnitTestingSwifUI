const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send("Hello World! open post['/login'] request")
})

const users = [
    {username:"udayhrudai",password:"password"},
    {username:"mrunalthakur",password:"password"}
]
app.use(express.json())
//login
app.post("/login",(req,res)=>{
    const username =  req.body.username
    const pwd = req.body.password
    const isAuthUser = users.find((user)=>{
        //console.log(user)
        return user.username == username && user.password == pwd
    })
    //console.log(isAuthUser)
    if(isAuthUser){
        res.json(
        {
            username:isAuthUser.username,
            success: true,
        }
        )
    }
    else{
        res.json({username:"undefined",
            success: false})
    }
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port} http://localhost:3000/`)
})