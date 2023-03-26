
const express = require('express')
const app1 = express()
const port = 3001

app1.get('/app1', (req, res) => {
    res.send('The NodeJS App1 is running from Docker Container !---')
})

app1.listen(port, () => {
    console.log(`Example app1 listening on port ${port}`)
})
