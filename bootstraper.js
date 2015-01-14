var facts = require("sfacts");
var fs = require("fs");

var worldData = [
  // './data/adjectivehierarchy.top',
  // './data/adverbhierarchy.top',
  // './data/affect.top',
  // './data/worlddata/basicgeography.tbl',
  './data/concepts.top',
  './data/names.top',
  './data/oppisite.tbl',
  './data/prepositionhierarchy.top',
  './data/verbhierarchy.top',
  './data/worlddata/animals.tbl',
  './data/worlddata/color.tbl'
];

facts.load(worldData, "britfacts", function(err, res){
  
  var parse = require("superscript/lib/parse")(res);
  parse.loadDirectory('./topics', function(err, result) {
    fs.writeFile('./data.json', JSON.stringify(result), function (err) {
  		console.log("Loaded");
    });
  });
});

