const { Router } = require('express');
const router = Router();
const BD = require('../config/configbd');
const { exec } = require("child_process");

router.get('/getPDF', async (req, res) => { //get y post => nombre apellido js sincrono
    //sql = "SELECT nombres||' '||apellidos from persona WHERE STATE=1";
    sql = `BEGIN PR_Test(); END;`;

    //nombre,descripcion,precio_unidad,id_categoria
    let result = await BD.Open(sql, [], false);
   
    //facturas = [];

    
    res.json("exito");
})


router.get('/getCorreo', async (req, res) => { //get y post => nombre apellido js sincrono
    
    exec("sh correo.sh", (error, stdout, stderr) => {
        if (error) {
            console.log(`error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.log(`stderr: ${stderr}`);
            return;
        }
        console.log(`stdout: ${stdout}`);
    });
    res.json("Email enviado");
})

module.exports = router;
