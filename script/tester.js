var superscript = require("superscript").default;
var fs = require("fs");
var Utils = require("../node_modules/superscript/lib/bot/utils").default;
var async = require("async");
var mongoose = require('mongoose');
var sfact = require("sfacts");

mongoose.connect('mongodb://localhost/testbot', { server: { socketOptions: { keepAlive: 1 } } }, function(err){
  if (err) console.log("Error connecting to the MongoDB --", err);
});

var botOptions = {
  mongoose : mongoose,
  editMode : true,
  importFile: "./data.json",
  pluginsPath: "/Users/robellis/projects/brit/plugins"
};

var questionFile = "./questions/loebner.txt";

var eCount = 0;
var mCount = 0;

var botHandle = function(bot, message, cb) {
  bot.reply("userx", message.trim(), function(err, reply){ 
    if (reply.string == "") {
      console.log(message);
      console.log(JSON.stringify(reply.debug.matched_gambit, null, 2));
    } else {
      console.log("%s => (%s) %s",message, reply.topicName, reply.string);
    }
    cb(null);
  });
}

superscript.setup(botOptions, (err, botInstance) => {
  
  var fileContents = fs.readFileSync(questionFile,"utf-8");

  var itor = function(line, cb){
    var input = Utils.trim(line);
    if (input[0] !== "#" && input !== "") {
      botHandle(botInstance, input, cb);
    } else {
      cb(null)
    }
  }

  if (fileContents) {
    var fileArray = fileContents.split("\n");
    var part = fileArray.slice(0, 5);
    async.map(part, itor, function() {
      console.log("Done");
      process.exit(1);
    });
  }
});
