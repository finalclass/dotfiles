#!/usr/bin/env node
/*jshint ignore:start*/

const rp = require('request-promise');
const FP_TYPE = process.argv[2];
const EID = process.argv[3] || process.env.EID;
const DS = process.argv[4] || process.env.DS;
const COUCH_USER = process.env.COUCH_USER || 'admin';
const COUCH_PASSWORD = process.env.COUCH_PASSWORD || 'rm';
const auth = 'Basic ' + new Buffer(`${COUCH_USER}:${COUCH_PASSWORD}`).toString('base64');

if (FP_TYPE === 'help' || !FP_TYPE) {
    console.log(
`Usage:

fc-get-fp-type.js FP_TYPE [EID] [DS]

EID and DS are optional. If not specified then are taken from env variables`
    );
    process.exit(1);
}

(async function () {
    try {
        const event = await rp({
            url: DS + '/api/v1/eid/' + EID,
            headers: { Authorization: auth },
            json: true
        });
        const instanceUrl = event.nodes[0].instanceurl;
        const result = await rp({
            url: `${instanceUrl}/dbnode-ev-${EID}/_design/victorinox/_view/query`,
            qs: {
                include_docs: true,
                startkey: JSON.stringify([FP_TYPE]),
                endkey: JSON.stringify([FP_TYPE, {}]),
            },
            headers: { Authorization: auth },
            json: true
        });
        var docs = result.rows.map(r => r.doc);
        process.stdout.write(JSON.stringify(docs, null, '    ') + '\n');
    } catch(err) {
        console.error('Error', err.stack);
        process.exit(1);
    }
}());
