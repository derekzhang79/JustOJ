
var exec  = require('child_process').exec;

var colors = require('colors');


/**
 *
 * @param codeDir    -> name of the program folder created by uuid. example: 89e99d8b-4552-41f1-8a12-76668334328d
 * @param inputPath  -> judge data inputfile path
 * @param fn
 */
exports.run = function run(opts,testCase,fn){

    var command =  './helpers/compiler/sandbox/safe ';
    command += opts.runName + '/code ';
    command += testCase + '/i.txt ';
    command += '/home/run/' + opts.runName + '/output.txt ';
    command += '/home/run/' + opts.runName + '/error.txt ';
    command += opts.runDir + '/result.txt ';
    command += String(opts.timeLimit) + ' ';
    command += String(opts.memoryLimit);


    console.log('[CODE-RUN]: '.red + command.cyan);

    exec(command,{ env: process.env }, fn);
};


/**
 *
 * @param codePath -> example: /SECURITY/JAIL/home/run/89e99d8b-4552-41f1-8a12-76668334328d
 * @param fn
 * @returns {*}
 */
exports.compile = function compile(opts,fn){

    var command = null;
    switch(opts.language) {
        case 'c':
            command = 'gcc -w -O2 -fomit-frame-pointer -lm -o ' + opts.runDir +'/code code.c';
            break;
        case 'cpp':
            command =  'g++ -w -O2 -fomit-frame-pointer -lm -o ' + opts.runDir + '/code code.cpp';
            break;
        case 'java':
            return fn('Java will be supported soon!','');
            break;
        default:
            return fn('invalid language','');
    }

    console.log('[CODE-COMPILE]: '.red +  (opts.codeDir).cyan);

    var cnfg = {
        env: process.env,
        timeout: 0,
        maxBuffer: 1000*1024,
        cwd: opts.codeDir
    };

    exec(command, cnfg, function(err, stdout, stderr) {
        if (err) {
            return fn(err,stderr);
        }
        fn(null,null, stdout);
    });

};
