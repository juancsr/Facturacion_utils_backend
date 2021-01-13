const oracledb = require('oracledb');

cns = {
    user: "test",
    password: "1234",
    connectString: "172.17.0.2/ORCL18"
}


cns_gcp = {
    user: "hr",
    password: "oracle",
    connectString: "34.68.135.29/XEPDB1",
}

const env = process.env.ENV || 'DEV';

async function Open(sql, binds, autoCommit) {
    let cnn;
    switch (env) {
        case 'PROD':
            console.log('running in PROD environment')
            cnn = await oracledb.getConnection(cns_gcp);
            break;
        case 'DEV':
            console.log('running in DEV environment')
            cnn = await oracledb.getConnection(cns);
        default:
            cnn = await oracledb.getConnection(cns);
            break;
    }
    //let cnn = await oracledb.getConnection(cns);
    let result = await cnn.execute(sql, binds, { autoCommit });
    cnn.release();
    return result;
}

exports.Open = Open;