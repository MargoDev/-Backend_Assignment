const express = require('express');
const router = express.Router();
const dbConnection = require('../db');

router.get('/', (req, res) => {res.redirect('https://app.swaggerhub.com/apis-docs/MargoDev/BackendDevTest/1.0')});

router.get('/backend/balance/:account', (req, res) => {
    try {
        let account = Number.parseInt(req.params.account);
        let query = `call getBalance(?);`
        if (account.toString().length == 9){
            dbConnection.query(query, [account], (err, rows, fields) => {
                processResponse(err, rows[0], res);
            });
        } else {
            res.json({"error": "transfer failed, see logs for details"});
        }
    } catch (error) {
        res.writeHead(400,{'Content-Type':'application/json'});
        res.json(error);
    }
});

router.get('/backend/inputs/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `call getMoves(?, 0);`
    if (account.toString().length == 9){
        dbConnection.query(query, [account], (err, rows, fields) => {
            processResponse(err, rows, res);
        });
    } else {
        res.json({"error": "account info missing for inputs , see logs for details" });
    }
});

router.get('/backend/outputs/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `call getMoves(?, 1)`
    if (account.toString().length == 9){
        dbConnection.query(query, [account], (err, rows, fields) => {
            processResponse(err, rows, res);
        });
    } else {
        res.json({"error": "account info missing for outputs , see logs for details" });
    }
});

router.get('/backend/history/:account', (req, res) => {
    let account = Number.parseInt(req.params.account);
    let query = `call getMoves(?, 0);`
    if (account.toString().length == 9){
        dbConnection.query(query, [account], (err, rows, fields) => {
            processResponse(err, rows, res);
        });
    } else {
        res.json({"error": "info account history missing, see logs for details" });
    }
});

router.post('/backend/transfer', (req, res)=>{
    let {fromAccount, toAccount, amount} = req.body;
    let query = `CALL transfers(?, ?, ?)`;
    if (fromAccount.toString().length == 9 && toAccount.toString().length == 9){
        dbConnection.query(query, [fromAccount,toAccount,amount], (err, rows, fields) => {
            processResponse(err, rows[0], res);
        });
    } else {
        res.json({"error": "one or both account are wrong, see logs for details" });
    }
});

function processResponse(err, rows, res) {
    if (!err){
        res.json(rows[0]);
    }else{
        console.log('show error :: ', err);
    }
}

module.exports = router;