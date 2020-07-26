const express = require('express');
const app = express();

// settings 
app.set('port', process.env.PORT ||3000);

//middlewares
app.use(express.json());

//routes
app.use(require('./routes/accounts'))

//starting server
app.listen(app.get('port'), ()=> {
    console.log('Server listening in port ::', app.get('port'));
})