const mysql = require('mysql');
const db = mysql.createConnection({
    host:'bfivytbdx3azjl87gze7-mysql.services.clever-cloud.com',
    user:'ur8xsrz96xriblut',
    password: 'YdfqIstBdGSMFNSgCjEL',
    database:'bfivytbdx3azjl87gze7'
});

db.connect(
    (err)=>{
        if (err){
            console.log('An error occurred :: ', err);
            return;
        } else {
            console.log(' DB is connected ');
        }
    }
)

module.exports = db;