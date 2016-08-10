#!/usr/bin/env node

/*
use it like this:

tail -f logs.log | while read line; do echo "$line" | fc-log.js; done

You can set a log level as well by parsing the argument to fc-log.js like this:

tail -f logs.log | while read line; do echo "$line" | fc-log.js warn; done

with this command you will see only warn and error logs

Third argument can shut the json and just show the message:

tail -f logs.log | while read line; do echo "$line" | fc-log.js all --only-message; done

*/

var stdin = process.stdin;
var stdout = process.stdout;
var inputChunks = [];
var LEVELS = ['info', 'debug', 'warn', 'error'];
var level = LEVELS.indexOf(process.argv[2]);
var onlyMessage = process.argv[3] === '--only-message';

stdin.resume();
stdin.setEncoding('utf8');

stdin.on('data', function (chunk) {
    try {
        var parsed = JSON.parse(chunk);
        var logLevel = LEVELS.indexOf(parsed.level);
        if (level > logLevel) {
            return;
        }
        if (onlyMessage) {
            log(parsed.label + ': ' + parsed.message);
        } else {
            log(parsed);
        }
    } catch (err) {
        log(chunk);
    }
});

/**
 * Does console.log and formats the data nicer
 * @param {any[]} ...args
 */
function log() {
    var args = Array.prototype.slice.call(arguments);
    var logToWrite = args.map(function (arg) {
        var str;
        var argType = typeof arg;

        if (arg === null) {
            str = 'null';
        } else if (arg === undefined) {
            str = '';
        } else if (!arg.toString || arg.toString() === '[object Object]') {
            str = JSON.stringify(arg, null, '  ');
        } else if (argType === 'string') {
            str = '"' + arg.toString() + '"';
        } else {
            str = arg.toString();
        }

        return '\x1b[36m<\x1b[0m' + str + '\x1b[36m>\x1b[0m';
    }).join(', ');
    console.log(logToWrite);
}
