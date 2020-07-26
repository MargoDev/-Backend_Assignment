const express = require('express');
const router = express.Router();
const dbConnection = require('../db');

router.get('/backend/balance/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `
        call getBalance(?);`
    dbConnection.query(query, [account], (err, rows, fields) => {
        processResponse(err, rows, res);
    });
});

router.get('/backend/inputs/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `call getMoves(?, 0);`
    dbConnection.query(query, [account], (err, rows, fields) => {
        processResponse(err, rows, res);
    });
});

router.get('/backend/outputs/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `call getMoves(?, 1);`
    dbConnection.query(query, [account], (err, rows, fields) => {
        processResponse(err, rows, res);
    });
});

router.get('/backend/history/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `call getMoves(?, 2);`
    dbConnection.query(query, [account], (err, rows, fields) => {
        processResponse(err, rows, res);
    });
});

router.post('/backend/transfer', (req, res)=>{
    const {fromAccount, toAccount, amount} = req.body;
    
    const query = `CALL transfers(?, ?, ?);`;
    dbConnection.query(query, [fromAccount,toAccount,amount], (err, rows, fields) => {
        processResponse(err, rows, res);
    });
});

function processResponse(err, rows, res) {
    if (!err){
        res.json(rows[0]);
    }else{
        console.log('show error :: ', err);
    }
}

module.exports = router;