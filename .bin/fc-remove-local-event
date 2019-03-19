#!/usr/bin/env node
/*jshint esversion: 6*/

var request = require('request');
var EID = process.argv[2];

if (!EID) {
    console.log(`Usage: fc-remove-local-event.js EID`);
    process.exit(1);
}

function url(db, doc = '') {
    return `http://admin:rm@localhost/${db}/${doc}`;
}

function getDoc(docDb, docId) {
    return new Promise((resolve, reject) => {
        request({
            method: 'GET',
            url: url(docDb, docId),
            json: true
        }, function (err, response, body) {
            if (err) {
                console.error(docDb, docId, err);
                return resolve({});
            }
            resolve(body);
        });
    });
}

function removeDoc(docDb, docId) {
    console.log('Removing DOC: ' + docDb + '/' + docId);
    getDoc(docDb, docId)
    .then((doc) => {
        if (!doc._rev) {
            return Promise.resolve();
        }
        return new Promise((resolve, reject) => {
            return request({
                method: 'DELETE',
                url: url(docDb, docId),
                qs: {
                    rev: doc._rev
                }
            }, function (err, response, body) {
                if (err) {
                    console.warning(docDb, docId, err);
                    return resolve({});
                }
                resolve();
            });
        });
    });
}

function removeDb(db) {
    console.log('Removing DB: ' + db);
    return new Promise((resolve, reject) => {
        return request({
            method: 'DELETE',
            url: url(db)
        }, function (err, response, body) {
            if (err) {
                console.error(db, err);
                return resolve({});
            }
            return resolve({});
        });
    });
}

Promise.resolve()
.then(() => removeDb('dbnode-ev-' + EID))
.then(() => removeDb('dbnode-evinq-' + EID))
.then(() => removeDoc('db4p-ds', EID))
.then(() => removeDoc('_replicator', `andromeda-${EID}-downstream`))
.then(() => removeDoc('_replicator', `census-${EID}-upstream`))
.then(() => removeDoc('_replicator', `husher-${EID}-downstream`))
.then(() => removeDoc('_replicator', `local_users-${EID}-downstream`))
.then(() => removeDoc('_replicator', `pumper-${EID}-downstream`))
.then(() => removeDoc('_replicator', `replrestrictions-${EID}-downstream`))
.catch(function (err) {
    console.error(err);
    process.exit(1);
});

