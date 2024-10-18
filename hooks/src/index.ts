import express from 'express'
import { PrismaClient } from '@prisma/client'

const client = new PrismaClient()

const app = express()

app.use(express.json())

// hooks endpoint in zapier is like this 
// htttps://hooks.zapier.com/hooks/catch/170346863/4276737397

app.post('/hooks/catch/:userId/:zapId', async (req, res) => {

    const zapId = req.params.zapId
    const userId = req.params.userId
    const body = req.body

    await client.$transaction(async tx => {
        const run = await tx.zapRun.create({
            data: {
                zapId, 
                metadata:body
                
            }
        })

        await tx.zapRunOutbox.create({
            data: {
                zapRunId: run.id
            }
        })
    })


})

app.listen(3000, ()=>{
    console.log('app is listening')
})