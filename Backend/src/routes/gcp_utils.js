// Este archivo para poder utilizar variables o funciones comunes en todos los endpoints

/*
* La función imprime el error en consola y devuelve automáticamente un json como respuesta en el endpoint 
* errorMsg: Es el valor del error para retornar  en el json
*/
const { Storage } = require('@google-cloud/storage');

const storage = new Storage();

const uploadFile = async (filename) => {
    // Uploads a local file to the bucket
    const bucketName = 'reportes_facturacion';
    await storage.bucket(bucketName).upload(filename, {
        destination: filename,
        metadata: {
            cacheControl: 'public, max-age=31536000',
        },
    });

    console.log(`${filename} uploaded to ${bucketName}.`);
}

const errorReturn = (endpoint, errorMsg) => {
    console.error(`Error en ${endpoint} -> ${errorMsg}`);
    return { error: true }
}

module.exports = {
    errorReturn: errorReturn
}
