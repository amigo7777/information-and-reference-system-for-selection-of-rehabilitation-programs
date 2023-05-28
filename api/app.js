const express = require('express')

const { sequelize, program, User } = require('./models')

const app = express()
app.use(express.json())

// создание программ реабилитации
app.post('/program', async (req, res) =>{
    const {name, description, duration, goal, result, disease} = req.body

    try{
        const prog = await program.create({name, description, duration, goal, result, disease})

        return res.json(prog)
    } catch(err){
        console.log(err)
        return res.status(500).json(err)
    }
})

// получение программ реабилитации
app.get('/program', async (req,res) =>{
    try{
        const prog = await program.findAll()

        return res.json(prog)
    }catch (err) {
        console.log(err)

        return res.status(500).json({error: 'Error: server guru meditation'})
    }
})

//авторизация пользователя
app.post('/auth', async(req, res)=>{
    
    const user = await User.findOne({where: {username: req.body.username, password: req.body.password}})
    if(!user){
        return res.status(404).json({error: 'There is no such user'}) // Пользователя не существует
    }
    else{
        // const token = await Token.create({value: generate_token(32), userId: user.id}) // сделать таблицу токенов
        // return res.status(200).json({accessToken: token.value}) 
       return res.status(200).json({msg: 'Such a user exists'}) //сообщение о том что пользователь существует
    }
    
})

//регистрация пользователя
app.post('/registration', async(req, res)=>{
    
    const {username, password} = req.body
    try{
        const user = await User.create({username, password})

        return res.json(user)
    }catch(err){

        console.log(err)
        return res.status(500).json(err)
    }
    
})

app.listen({port: 3080}, async()=>{
    console.log('Server up on http://localhost:3080')
    await sequelize.authenticate()
    console.log('Database Connected!')
    // await sequelize.sync({alter: true})
})