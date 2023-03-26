
const express = require('express')
const app2 = express()
const port = 3002

app2.get('/app2', (req, res) => {
    res.send('The NodeJS App2 is running from Docker Container !---')
})

app2.listen(port, () => {
    console.log(`Example app2 listening on port ${port}`)
})
