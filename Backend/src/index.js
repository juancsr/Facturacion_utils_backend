const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const app = express(); //instancia de express

//imports
const FacturaRoutes = require('./routes/factura-rotes');
//settings
app.set('port', process.env.PORT || 3010);

//middlewares
app.use(morgan('dev')); //paso por morgan antes del llegar al end point
app.use(express.json());
app.use(express.urlencoded({ extended: false }));

//routes
app.use(FacturaRoutes);

//run
app.listen(app.get('port'), () => {
    console.log(`Server on Port ${app.get('port')}`)
})

