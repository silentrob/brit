var debug = require("debug")("UserFacts");
var _ = require("lodash");


// What does my dad like to play?
exports.queryUserFact = function(subject, verb, cb) {
  var subject = subject.replace(/\s/g,"_").toLowerCase();
  var memory = this.user.memory;
  memory.db.get({subject:subject, predicate:verb}, function(err, result){
    if (!_.isEmpty(result)) {
      cb(null, result[0].object);
    } else {
      memory.db.get({object:subject, predicate:verb}, function(err, result){
        if (!_.isEmpty(result)) {
          cb(null, result[0].subject);
        } else {
          cb(null,"");
        }
      });
    }
  });
}
