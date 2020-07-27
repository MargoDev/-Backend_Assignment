# Backend_Assignment
Digital Hub - Backend Assignment - CP
Example develpment by Mariano Arturo Gómez Ibánez
 
first install npm modules
#npm install

 if you want use DB local please use files into dir SchemaMarGzIbz
 and change file db.js 
 this project is configured for use a DB online 
# node src/index.js

 the project root redirect to swagger's documentation

# /backend/balance/:accId
 use this path with GET for get account balance 

# /backend/inputs/:accId
 use this path with GET for get account´s inputs transactions

# /backend/outpust/:accId
 use this path with GET for get account's outputs transactions

# /backend/history/:accId
 use this path with GET for get all account transactions 

# /backend/transfer
 use this path with POST and next json 

# {
#  "accountFrom":123456789,
#  "accountTo":987654321,
#  "amount":94.54
# }
