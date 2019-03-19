#!/usr/bin/env node

var sh = require('shelljs');
var tag = process.argv[2];

sh.cd('~/Documents/spotme/tool-deployment/ansible');
sh.env['ANSIBLE_FORCE_COLOR'] = true;
sh.exec('ansible-playbook site.yml -i testing -l staging2.4pax.com --vault-password-file ~/.vault-pass -t ' + tag);
