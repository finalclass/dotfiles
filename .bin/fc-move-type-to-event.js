#!/usr/bin/env node

var request = require('request');

if (process.argv.length < 5) {
    console.log('Usage:');
    console.log('fc-move-type-to-event.js url-db-from url-db-to fpType');
    console.log('Example');
    console.log('fc-move-type-to-event.js http://euadmin1.spotme.com/dbnode-ev-EID http://localhost/dbnode-ev-EID session')
    console.log('To specify custom credentials use environment variables:');
    console.log('DB_FROM_USER=cloudadmin DB_FROM_PASSWORD=asdaslikj33443432sad DB_TO_USER=admin DB_TO_PASSWORD=rm fc-move-type-to-event.js url-db-from url-db-to fpType')
    console.log('Default credentials are: admin/rm');
    process.exit;
}

var DB_FROM_USER = process.env.DB_FROM_USER || 'admin';
var DB_FROM_PASSWORD = process.env.DB_FROM_PASSWORD || 'rm';
var DB_TO_USER = process.env.DB_TO_USER || 'admin';
var DB_TO_PASSWORD = process.env.DB_TO_PASSWORD || 'rm';
var DB_FROM = process.argv[2];
var DB_TO = process.argv[3];
var FP_TYPE = process.argv[4];

//$AUTH_DB/dbnode-ev-$EID/_design/victorinox/_view/query?startkey=[\"$(echo $TYPE)\"]&endkey=[\"$(echo $TYPE)\",{}]&include_docs=true

request.get(DB_FROM + '/_design/victorinox/_view/query'
    + '?startkey=' + JSON.stringify([FP_TYPE])
    + '&endkey=' + JSON.stringify([FP_TYPE, {}])
    + '&include_docs=true', {
        auth: {
            user: DB_FROM_USER,
            pass: DB_FROM_PASSWORD
        }
    }, panicOnError('request to db_from failed', function (response, body) {
        var docs = JSON.parse(body).rows.map(function (row) {
            delete row.doc._rev;
            return row.doc;
        });
        request.post({
            url: DB_TO + '/_bulk_docs',
            json: true,
            body: {docs: docs},
            auth: {
                user: DB_TO_USER,
                pass: DB_TO_PASSWORD
            }
        }, panicOnError('error inserting docs', function (response, body) {
            console.log('BODY', body);
        }));
    }));

function panicOnError(msg, callback) {
    return function (err) {
        if (err) {
            console.error(msg, err);
            return process.exit(1);
        }
        var args = Array.prototype.slice.call(arguments, 1);
        callback.apply(null, args);
    }
}