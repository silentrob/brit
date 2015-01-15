// Run this and then telnet to localhost:2000 and chat with the bot

var net             = require("net");
var superscript     = require("superscript");
var debug           = require('debug')("Server");
var fs              = require("fs");
var Utils           = require("./node_modules/superscript/lib/utils");
var async           = require("async");

var questionFile = "./questions/loebner.txt";

var options = { 
  scope: {
    cnet : require("conceptnet")({host:'127.0.0.1', user:'root', pass:''})
  }
};

var data = [
  './data/bigrams.tbl',
  './data/trigrams.tbl',
  './data/concepts.top',
  './data/names.top',
  './data/oppisite_new.tbl'];

var botData = [
  './data/botfacts.tbl'
];

var facts = require("sfacts");

var eCount = 0;
var mCount = 0;

var botHandle = function(bot, message, cb) {
  bot.reply("userx", message.trim(), function(err, reply){ 
    if (reply == "") {
      console.log(message, "=>", reply);
    }
    
    cb(null);
  });
}


facts.load(data, 'britfacts', function(err, f) {
  options.factSystem = f; 
  f.createUserDBWithData('botfacts', botData, function(err, botfacts){
    options['botfacts'] = botfacts;

    new superscript('./data.json', options, function(err, botInstance){

        
      var fileContents = fs.readFileSync(questionFile,"utf-8");
  

      var itor = function(line, cb){
        var input = Utils.trim(line);
        if (input[0] != "#" && input != "") {
          botHandle(botInstance, input, cb);
        } else {
          cb(null)
        }
      }


      if (fileContents) {
        var fileArray = fileContents.split("\n");
        var part = fileArray.slice(0,100);

        async.map(part, itor, function(){
          console.log("Done");
          process.exit(1);
        })
      }
      
    });
  });
});

