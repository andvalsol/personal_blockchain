const Web3 = require('web3')
const web3 = new Web3("HTTP://127.0.0.1:7545")

web3.eth.getBalance("0x1D0D21a221869Ba0Afd9Ff0483B699c8865e5e3F").then(console.log)