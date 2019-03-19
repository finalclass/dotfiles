#!/usr/bin/env node

var EID = process.env.EID;

if (!EID) {
    console.log('Usage: node prepare-scale-results.js EID');
    process.exit(1);
}

var _ = require('underscore');
var cradle = require('cradle');
var db = new cradle.Connection('http://localhost', 80, {
    auth: {username: 'admin', password: 'rm'}
}).database('dbnode-ev-' + EID);
var type = process.argv[2];
var max = process.argv[3];
var nofDocs = 0;

streamByType(db, type, onGotDocs, onStreamComplete);

function onGotDocs(docs, next) {
    docs.forEach(function (doc) {
	doc._deleted = true;
    });
    console.log('REMOVING ' + docs.length  + ' docs');
    db.save(docs, function (err, results) {
        if (err) {next(err);}
        nofDocs += results.length;
        if (max && nofDocs >= max) {
            console.log('reached max, stopping');
            process.exit(0);
        }
        next();
    });
}

function onStreamComplete(err) {
    if (err) {return onError(err);}
    console.log('DONE, removed ' + nofDocs + ' ' + type + ' documents');
}

function onError(err) {
    if (err) {
        console.log('Error', err);
        process.exit(1);
    }
}

function streamByType(db, type, onDocs, done) {
    var DOCS_PER_CALL = 1000;

    function fetch(offset, callback) {
        db.view('victorinox/query', {
	    startkey: [type],
	    endkey: [type, {}],
            limit: DOCS_PER_CALL,
            skip: offset,
	    include_docs: true
        }, function (err, rows) {
            if (err) {
                return callback(err);
	    }
            var docs = _.map(rows, function (row) {
	        return row.doc;
	    });
            var len = docs.length;

            if (rows.length === 0) {
                return callback();
            }
            console.log('Calling onDocs for ' + len + ' docs');
	    onDocs(docs, function (err) {
                if (err) {
                    return callback(err);
                }
                fetch(offset += DOCS_PER_CALL, callback);
            });
            setTimeout(function () {
                rows = null;
                docs = null;
            }, 10);
        });
    }

    return fetch(0, function (err) {
        done(err);
    });
}
