#!/usr/bin/env node

const os = require('os');
const rp = require('request-promise');
const _ = require('lodash');
const keychain = require('requireg')('tool-fp-packaging/src/keychain');
const uuid = require('uuid');

const DS_URL = process.env.DS_URL || 'http://localhost';
const DS_BSTG_URL = process.env.DS_BSTG_URL || 'http://localhost.backstage.4pax.com';
const EID = process.env.EID;

(async () => {
    try {
        // await initEventDoc();
        await initPersons();
    } catch (err) {
        console.error(err);
        process.exit(1);
    }
})();

async function initPersons() {
    const persons = await getByFpType('person');

    ensurePersonExists(
        'person',
        {
            fname: 'AAA',
            lname: 'aaa',
            email: 'aaa@aaa.aa',
            fp_status: 'active',
            do_not_track: false
        },
        persons
    );

    ensurePersonExists(
        'person',
        {
            fname: 'BBB',
            lname: 'bbb',
            email: 'bbb@bbb.bb',
            fp_status: 'active',
            do_not_track: false
        },
        persons
    );
}

async function ensurePersonExists(doc, personsCollection) {
    const exists = _.find(personsCollection, pax => {
        return _.isEqual(_.pick(pax, _.keys(doc)), doc);
    });
    if (exists) {
        return;
    }
    
    doc.fp_ext_id = doc.fp_ext_id || uuid();
    doc.fp_type = 'person';
    doc.fp_owner = doc.fp_owner || 'global';
    doc.fp_created_timestamp =
        doc.fp_created_timestamp || Math.round(Date.now() / 1000);

    const headers = {
        Authorization: await keychain.getCredentialsAsBasicAuthHeader(DS_BSTG_URL)
    };
    
    return await rp({
        method: 'POST',
        url: `${DS_BSTG_URL}/_router/localhost/api/v1/eid/${EID}/data/person`,
        qs: {
            fieldsToFillIfEmpty: true,
            include_upserted_doc_ids: true
        },
        body: doc,
        headers
    });
}

function ensureDocExists(fpType, doc, docsOfType) {
    const exists = _.find(docsOfType, _doc => {
        return _.isEqual(_.pick(_doc, _.keys(doc)), doc);
    });
    if (exists) {
        return;
    }
    doc.fp_ext_id = doc.fp_ext_id || uuid();
    doc.fp_type = fpType;
    doc.fp_owner = doc.fp_owner || 'global';
    doc.fp_created_timestamp =
        doc.fp_created_timestamp || Math.round(Date.now() / 1000);

    return upsertDoc(doc);
}

async function initEventDoc() {
    const eventDoc = await getDoc(EID);
    const instanceUrl = 'http://' + getIP();

    if (!eventDoc.nodes.local || eventDoc.nodes.local.url !== instanceUrl) {
        eventDoc.nodes.local = { url: instanceUrl };
    }

    eventDoc.networks.cloud = {
        default: true,
        nodes: ['local']
    };

    await upsertDoc(eventDoc);
}

async function getByFpType(fpType) {
    const result = await couchDbRequest({
        path: '/_design/victorinox/_view/query',
        qs: {
            startkey: JSON.stringify([fpType, null]),
            endkey: JSON.stringify([fpType, {}]),
            include_docs: true
        }
    });

    return _.map(result.rows, 'doc');
}

function getDoc(docId) {
    return couchDbRequest({ path: docId });
}

function upsertDoc(doc) {
    const method = doc._id ? 'PUT' : 'POST';
    doc._id = doc._id || uuid().replace(/-/g, '');

    return couchDbRequest({
        method,
        path: method === 'PUT' ? doc._id : '',
        body: doc
    });
}

async function couchDbRequest(params) {
    const url = DS_URL + '/dbnode-ev-' + EID + '/' + params.path;
    delete params.path;

    const headers = {
        Authorization: await keychain.getCredentialsAsBasicAuthHeader(DS_URL)
    };

    return await rp(
        _.extend(
            {
                url,
                json: true,
                headers
            },
            params
        )
    );
}

function getIP() {
    const ifaces = os.networkInterfaces();

    Object.keys(ifaces).forEach(ifname => {
        let alias = 0;

        ifaces[ifname].forEach(iface => {
            if ('IPv4' !== iface.family || iface.internal !== false) {
                // skip over internal (i.e. 127.0.0.1) and non-ipv4 addresses
                return;
            }

            if (alias >= 1) {
                // this single interface has multiple ipv4 addresses
                console.log(ifname + ':' + alias, iface.address);
            } else {
                // this interface has only one ipv4 adress
                console.log(ifname, iface.address);
            }
            ++alias;
        });
    });

    const addresses = Object.values(ifaces).reduce((arr, iface) => {
        arr = arr.concat(iface.map(f => f.address));
        return arr;
    }, []);

    return addresses.filter(addr => addr.indexOf('192.') === 0)[0];
}
