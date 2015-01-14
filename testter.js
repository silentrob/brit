// Run this and then telnet to localhost:2000 and chat with the bot

var net             = require("net");
var superscript     = require("superscript");
var debug           = require('debug')("Server");
var fs              = require("fs");
var readline        = require('readline');
var stream          = require('stream');

var questionFile = "./questions/smt.txt";

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

var facts = require("sfacts");

var eCount = 0;
var mCount = 0;
var sockets = [];

var botHandle = function(bot, message) {
  bot.reply("userx", message.trim(), function(err, reply){
    mCount++;
    if (reply == "" || reply == "I have noting to say") {
      eCount++;
      console.log(message, "=>", reply);  
    }
    
    console.log("MTotal", mCount, "ETotal", eCount)
  });
}

facts.load(data, 'britfacts', function(err, f) {
  
  // f.conceptToList("family_adult", function(e,r) {
  //   console.log("--", e,r);
  // });

  new superscript('./data.json', options, function(err, botInstance){

    var instream = fs.createReadStream(questionFile);
    var outstream = new stream;
    outstream.readable = true;
    outstream.writable = true;

    var rl = readline.createInterface({
      input: instream,
      output: outstream,
      terminal: false
    });
  
    rl.on('line', function(line) {
      botHandle(botInstance, line + "?");
    });

  });
});

