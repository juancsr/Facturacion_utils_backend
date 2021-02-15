const { Router } = require('express');
const router = Router();
const BD = require('../config/configbd');
const { exec } = require("child_process");
const GCP_UTILS = require('./gcp_utils');

router.post('/uploadFileToBucket', async (req, res) => { //get y post => nombre apellido js sincrono
    const { filename } = req;
    console.log('uploading...');
    // GCP_UTILS.uploadFile(filename);
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
