#!/usr/bin/env node

var fs = require('fs');
var exec = require('child_process').exec;

function mapAsync(items, onIterate, onComplete) {
    var remaining = items.length;
    items.forEach(function (item, index) {
        onIterate(item, index, function next() {
            remaining -= 1;
            if (remaining === 0) {
                onComplete();
            }
        });
    });
}

fs.readdir(process.cwd(), function (err, projects) {
    mapAsync(projects, function onIterate(item, index, next) {
        var cmd = 'cd ' + item + ' && fc-deploy.sh';
        console.log('...deploying ' + item);
        exec(cmd,  function (error, stdout, stderr) {
            console.log('stdout: ' + stdout);
            console.log('stderr: ' + stderr);
            if (error !== null) {
                console.log('exec error: ' + error);
            } else {
                console.log(item + ' deployement complete');
            }
            next();
        });
    }, function onComplete() {
        console.log('Completed');
    });
});


//Prvious BASH version of the same script (but sync):
//
// for d in */ ; do
//     echo "Starting $d deploy"
//     cd $d
//     fc-deploy.sh
//     cd ../
// done
