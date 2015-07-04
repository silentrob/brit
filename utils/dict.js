var fs = require("fs");

module.exports = function(file) {

  var position = 0;
  var dictionary = {};

  try {
    dictionary = require(file);
  } catch(e) {
    console.log("Creating Empty file");
    fs.writeFileSync(file, JSON.stringify({}));
  }

  position = Object.keys(dictionary).length;

  return {
    dictionary: dictionary,
    addToDictionary: function(tokens) {
      for (var j = 0; j < tokens.length; j++) {
        var token = tokens[j].toLowerCase();
        if (!dictionary.hasOwnProperty(token)) {
          dictionary[token] = position;
          position++;
        }
      }
    },
    save: function() {
      fs.writeFileSync(file, JSON.stringify(dictionary));
    }

  };
};