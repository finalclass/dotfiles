#!/usr/bin/env node

var fs = require('fs');
var path = require('path');

console.log(recursiveFindPackageDir(process.cwd()));

/*********************************
 * Functions
 *********************************/

function isPackageDir(packageDir) {
    return fs.existsSync(path.resolve(packageDir, 'package', 'pkg.json'));
}

function isRoot(packageDir) {
    return packageDir === '/';
}

function recursiveFindPackageDir(startingDir) {
    if (isPackageDir(startingDir)) {
        return startingDir;
    }
    if (isRoot(startingDir)) {
        return null;
    }
    return recursiveFindPackageDir(path.resolve(startingDir, '..'));
}


