var accountSid = 'AC2a4a8d7bea1a42f1bdeec8c48903461d';
var authToken = "fa1edb1b07557434b0bf84b6d72fe030";
var botPhoneNumber = "+16048009115";

var client          = require('twilio')(accountSid, authToken);
var express         = require('express');
var bodyParser      = require('body-parser')
var superscript     = require("superscript");
var Utils           = require("../node_modules/superscript/lib/utils");
var mongoose        = require('mongoose');
var sfact           = require("sfacts");

var factSystem = sfact.create("/Users/robellis/projects/bot/superscript-editor/testbot");

mongoose.connect('mongodb://localhost/testbot', { server: { socketOptions: { keepAlive: 1 } } }, function(err){
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

var app = express();
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
 
new superscript(botOptions, function(err, botInstance){
  
  // Generic endpoint
  app.get('/', function (req, res) {
    res.send('Nothing to see.');
  });

  // Main endpoint
  app.post('/', function (req, res) {
    
    var message = req.body.Body;
    var userNumber = req.body.From;

    botInstance.reply(userNumber, message.trim(), function(err, reply){ 
      client.messages.create({
        body: reply.string,
        to: userNumber,
        from: botPhoneNumber 
      }, function(err, message) {
        console.log(err, message);
        res.status(201).end();
      });
    });
  });

  var server = app.listen(3000, function () {
    var host = server.address().address
    var port = server.address().port
    console.log('Example app listening at http://%s:%s', host, port)
  });

});


