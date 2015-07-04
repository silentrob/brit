var superscript     = require("superscript");
var debug           = require('debug')("Server");
var fs              = require("fs");
var Utils           = require("../node_modules/superscript/lib/utils");
var async           = require("async");
var mongoose        = require('mongoose');
var sfact           = require("sfacts");

var factSystem = sfact.create("/Users/robellis/projects/bot/superscript-editor/testbot");

mongoose.connect('mongodb://localhost/brit', { server: { socketOptions: { keepAlive: 1 } } }, function(err){
  if (err) console.log("Error connecting to the MongoDB --", err);
});

var botOptions = {
  mongoose : mongoose,
  factSystem: factSystem,
  editMode : true,
  scope: {
    cnet : require("conceptnet")({host:'127.0.0.1', user:'root', pass:''})
  }
};

var questionFile = "./questions/loebner.txt";


var eCount = 0;
var mCount = 0;

var botHandle = function(bot, message, cb) {
  bot.reply("userx", message.trim(), function(err, reply){
    console.log(message.trim() , "=>" , reply.string );
    cb();
  });
};

new superscript(botOptions, function(err, botInstance){
  
  var fileContents = fs.readFileSync(questionFile,"utf-8");
  var itor = function(line, cb){
    var input = Utils.trim(line);
    if (input[0] != "#" && input !== "") {
      botHandle(botInstance, input, cb);
    } else {
      cb(null);
    }
  };

  if (fileContents) {
    var fileArray = fileContents.split("\n");
    var part = fileArray.slice(20,23);


    async.each(part, itor, function(){
      console.log("Done");
      process.exit(1);
    });
  }
});
