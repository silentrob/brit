var qtypes = require("qtypes");
var norm = require("node-normalizer");
var facts = require("sfacts");
var Message = require("./node_modules/superscript/lib/message");

var math = require("./plugins/math");
var factSystem = facts.create("systemDB");


var msgString = "Is 5, 7 and 11 even or odd?";

var func = "evenOdd";

var callback = function(err, res) {
  console.log("Done", res);
}

var scope = {
  user: {
    prevAns : undefined
  }
};

var args = [];

norm.loadData(function() {
  
  new qtypes(function(question) {

    var messageOptions = {
      qtypes: question,
      norm: norm,
      facts: factSystem
    };     
    
    new Message(msgString, messageOptions,  function(messageObject) {
      scope.message = messageObject;

      args.push(function customFunctionHandle(err, subreply) {
        callback(null, subreply);
      }); 

      math[func].apply(scope, args);

    });

  });
});


