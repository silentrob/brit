
// Wizard of OZ!
// Backchannel conversation to a different channel.
var waitForReply = 20000; // 15 seconds
var watchChannel = "backchannel";

exports.wizard = function(cb) {
  var that = this;
  var timer;
  var input = that.message.raw;

  var channel = that.slack.getGroupByName(watchChannel);

  channel.send(input);

  that.slack.on('message', function(data) {
    clearTimeout(timer);
    var messageData = data.toJSON();
    channel = that.slack.getChannelGroupOrDMByID(messageData.channel);

    if (channel.name === watchChannel) {
      if (messageData && messageData.text) {

        var reply = messageData.text.trim();

        // Lets add this message to the system
        var props = { name: 'backchannel' };
        that.topicSystem.topic.findOrCreate(props, {}, function(err, topic) {

          topic.createGambit({input:input}, function(er, gam) {
            gam.addReply({reply: reply}, function(err, rep) {
              // topic.sortGambits(function() {

                cb(null, reply);

              // });
            });
          });
        });
        
      } else {
        cb(null, "");
      }
    }
  });

  timer = setTimeout(function() {
    cb(null, "");
  }, waitForReply);

};