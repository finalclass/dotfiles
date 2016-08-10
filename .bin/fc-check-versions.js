#!/usr/bin/env node

var fs = require('fs');
var execSync = require('exec-sync');

var versions = execSync('git tag').split('\n');
var packageDir = execSync('fc-package-dir.js');
var pkgJson = require(packageDir + '/package/pkg.json');

versions.forEach(function (v) {
    var cmd = 'fp has-package ' + pkgJson.name + ' ' + v + ' -m 5000';
    console.log(cmd);
    var result = execSync(cmd);
    console.log(result);
});
