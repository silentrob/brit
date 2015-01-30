var express = require('express');
var app = express();
app.use(express.static(__dirname + '/public'));
var http = require('http').Server(app);

var io = require('socket.io')(http);
var ss = require("superscript");
var facts = require("sfacts");

var options = {
  scope: {
    cnet : require("conceptnet")({host:'127.0.0.1', user:'root', pass:''})
  }
}
var data = ['./data/color.tbl'];

app.get('/', function(req, res){
  res.sendFile(__dirname + '/views/index.html');
});

var users = [];

var botHandle = function(err, bot) {
    
  io.on('connection', function(socket) {

    var user_id = socket.handshake.address;

    console.log(user_id);
    if (!users[user_id]) {
      users.push(user_id);
    }
    
    // I flush the entrie DB until I can figure out how to pop events off the db
    setInterval(function(){
      for (var i = 0; i < users.length; i++) {
        bot.getUser(users[i], function(err, user){

          if (user) {

            socket.emit('stats', {
              id: user.id,
              conversation: user.conversation,
              currentTopic: user.currentTopic
            });  


            var mem = user.memory
            mem.db.get({}, function(err, all){
              socket.emit('memory', all);
            });
          }
        })
      }
    }, 1000);


    console.log("New connection from " + user_id);
    socket.emit('chat message', {text:'Welcome to the Brit Demo!'});
    
    socket.on('chat message', function(msg){
      // Emit the message back first
      socket.emit('chat message', { text: ">> " + msg });
      bot.reply(user_id, msg.trim(), function(err, resObj){
        socket.emit('chat message', { text: "<< " + resObj.string });
      });
    });
  });

  http.listen(3000, function(){
    console.log('listening on *:3000');
  });
}


facts.load(data, 'localdata', function(err, facts){
  options.factSystem = facts; 
      
  new ss('./data.json', options, function(err, botInstance){
    botHandle(null, botInstance);
  });
});


