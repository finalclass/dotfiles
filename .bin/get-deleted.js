const rp = require('request-promise');
const DB_COOKIE = process.env.DB_COOKIE;
const NODE_URL = process.env.NODE_URL;
const EID = process.env.EID;

(async function () {

    const { results: changes } = await rp({
        url: `${NODE_URL}/dbnode-ev-${EID}/_changes`,
        headers: { cookie: DB_COOKIE },
        json: true
    });

    const deletedIds = changes.reduce((acc, r) => {
        if (r.deleted) {
            acc.push(r.id);
        }
        return acc;
    }, []);

    const { rows: deletedRows } = await rp({
        url: `${NODE_URL}/dbnode-ev-${EID}/_all_docs`,
        headers: { cookie: DB_COOKIE },
        json: true,
        qs: {
            keys: JSON.stringify(deletedIds)
        }
    });

    const deletedDocs = deletedRows.map(r => {
        return Object.assign({}, r.value, { id: r.id });
    });


    for (let deletedDoc of deletedDocs) {
        const docRevs = await getDocRevs(deletedDoc);
        deletedDoc.docs = await Promise.all(docRevs.map(async rev => {
            return await getDoc(deletedDoc.id, rev);
        }));
        
    }

    process.stdout.write(JSON.stringify(deletedDocs, null, '    '));
}());

async function getDoc(id, rev) {
    return await rp({
        url: `${NODE_URL}/dbnode-ev-${EID}/${id}?rev=${rev}&revs=true`,
        headers: { cookie: DB_COOKIE },
        json: true
    });
}

async function getDocRevs({id, rev}) {
    const doc = await getDoc(id, rev);

    return doc._revisions.ids.reverse().map((revId, index) => {
        return (index + 1) + '-' + revId;
    });
}



