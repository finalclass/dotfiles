#!/usr/bin/env node

var nano = require('nano');
var request = require('request');
var potem = require('potem').potem;

var URL=process.argv[2];
var EID=process.argv[3];

if (!URL || !EID) {
    console.log('usage: fc-destroy-event.js http://user:password@dburl.4pax.com EID');
    process.exit(1);
}

var db = nano(URL).db.use('dbnode-ev-' + EID);


var p = potem()
        .then(function () {
            db.get('bstg-nav-bit:-nav_spotman', p.stdPause());
        })
        .then(function (doc) {
            doc.el = {_to_prune: true};
            db.insert(doc, p.stdPause());
        })
        .then(function compile() {
            request.post(URL + '/api/v1/eid/' + EID + '/compile/navs?prune=true', p.stdPause());
        })
        .then(function () {
            db.get('nav_home1', p.stdPause());
        })
        .then(function (doc) {
            doc.header = [];
            doc.el = [];
            db.insert(doc, p.stdPause());
        })
        .then(function () {
            db.get('appscripts', p.stdPause());
        })
        .then(function (appscripts) {
            appscripts.destroyer = {
                _on_load: (function (ctx) {
                    function openEventsList () {
                        ctx.event.ui.dispatchURL('spotme://openeventslist');
                    }

                    setTimeout(openEventsList, 1000);
                    setTimeout(openEventsList, 2000);
                    setTimeout(openEventsList, 3000);
                    setTimeout(openEventsList, 4000);
                    
                }).toString()
            };
            db.insert(appscripts, p.stdPause());
        })
        .then(function () {
            console.log('ALL good');
        })
        .error(function (err) {
            console.log('err', err, err.stack);
            //openeventslist 
        });

