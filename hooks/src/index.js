import express from 'express'
import {} from '@prisma/client'

const app = express()

// hooks endpoint in zapier is like this 
// htttps://hooks.zapier.com/hooks/catch/170346863/4276737397

app.post('/hooks/catch/:userId/:zapId', async (req, res) => {
    
    const zapId = req.params.zapId
    const userId = req.params.userId
    const body = req.body


})

app.listen(3000)