#!/usr/bin/env node

var sh = require('shelljs');

sh.cd('~/Documents/spotme/spotme3-configurations/config-generator');
sh.echo('Generating ~/system.json file');
sh.exec('node index.js system > ~/system.json');
sh.echo('Copying system.json to pentest1');
sh.exec('scp ~/system.json node@pentest1.4pax.com:~/conf/system.json');
sh.exec('ssh pentest1 "sudo service supervisor restart"');
