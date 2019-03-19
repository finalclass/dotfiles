#!/usr/bin/env node
/*jshint ignore:start*/

const debug = require('debug');
const rp = require('request-promise');
const log = debug('fc-push-docs:info');
const logError = debug('fc-push-docs:error');
const EID = process.argv[2] || process.env.EID;
const DS = process.argv[3] || process.env.DS;
const COUCH_USER = process.env.COUCH_USER || 'admin';
const COUCH_PASSWORD = process.env.COUCH_PASSWORD || 'rm';
const auth = 'Basic ' + new Buffer(`${COUCH_USER}:${COUCH_PASSWORD}`).toString('base64');

if (
    process.argv[2] === 'help' ||
    process.argv[2] === '?' ||
    process.argv[2] === '--help' ||
    process.argv[2] === '-h'
    ) {
    console.log(`Usage:
echo "[{test: 'doc'}]" | fc-push-docs.js [EID] [DS]

if EID or DS are not specified then they are taken from environment variables.`);
}

(async function () {
    try {
        const docs = await readJsonFromStdin();
        const event = await rp({
            url: DS + '/api/v1/eid/' + EID,
            headers: { Authorization: auth },
            json: true
        });
        const instanceUrl = event.nodes[0].instanceurl;
        const report = await sendDocs(docs, EID, instanceUrl);
        console.log(report);
    } catch (err) {
        console.error('Error', err.stack);
        process.exit(1);
    }
}());

function sendDocs(docs, eid, instanceUrl) {
    return rp({
        url: `${instanceUrl}/dbnode-ev-${EID}/_bulk_docs`,
        method: 'POST',
        headers: { Authorization: auth },
        body: { docs },
        json: true
    });
}

function readJsonFromStdin() {
    return new Promise((resolve, reject) => {
        log('reading json string from stdin start');
        var stdin = process.stdin;
        var inputChunks = [];

        stdin.resume();
        stdin.setEncoding('utf8');

        stdin.on('data', function (chunk) {
            log('received chunk')
            inputChunks.push(chunk);
        });

        stdin.on('end', function () {
            try {
                var inputJSON = inputChunks.join('');
                eval('var obj = ' + inputJSON);
                log('reading json success');
                obj.forEach((doc) => {
                    delete doc._rev;
                });
                resolve(obj);
            } catch (err) {
                logError('error reading json string from stdin', err);
                reject(err);
            }
        });

        stdin.on('error', (err) => {
            logError('error reading json string from stdin', err);
            reject(err);
        });
    });
}