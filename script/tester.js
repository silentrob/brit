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
  factSystem: { clean: true },
  pluginsPath: "/Users/robellis/projects/brit/plugins"
};

var questionFile = "./questions/loebner.txt";

var botHandle = function(bot, message, cb) {
  bot.reply("userx", message.input, function(err, reply){ 
    if (reply.string == "") {
      console.log(message.input);
      console.log(JSON.stringify(reply.debug.matched_gambit, null, 2));
    } else {
      if (message.assert) {
        console.log("%s => (%s) %s [%s]", message.input, reply.topicName, reply.string, message.assert);
      } else {
        console.log("%s => (%s) %s", message.input, reply.topicName, reply.string);  
      }
      
    }
    cb(null);
  });
}

var loebner = function(botInstance, cb) {
  var fileContents = fs.readFileSync(questionFile,"utf-8");

  var itor = function(line, cb){
    var input = Utils.trim(line);
    if (input[0] !== "#" && input !== "") {
      botHandle(botInstance, {input}, cb);
    } else {
      cb(null)
    }
  }

  if (fileContents) {
    var fileArray = fileContents.split("\n");
    var part = fileArray.slice(0, 2);
    async.mapSeries(part, itor, cb);
  }
};

var toytask = function(botInstance, cb) {
  var fileContents = fs.readFileSync("./questions/tasks/task_qa1_train.txt", "utf-8");
  
  var itor = function(line, cb) {
    
    if (line !== "" ){
      var parts = line.split("\t");
      var input = Utils.trim(parts[0].replace(/(^\d+)/, ""));
      botHandle(botInstance, {input, assert: parts[1]}, cb);
    } else {
      cb(null);
    }
  }

  if (fileContents) {
    var fileArray = fileContents.split("\n");
    var part = fileArray.slice(0, 15);
    async.mapSeries(part, itor, cb);
  }
};

superscript.setup(botOptions, (err, botInstance) => {
  
  loebner(botInstance, function() {
    console.log("Done");
    process.exit(1);
  });
});
