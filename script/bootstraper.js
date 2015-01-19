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
  var exists = fs.existsSync('./data.json');
  var contents = {};
  var sums = {};

  if (exists) {
    contents = fs.readFileSync('./data.json', 'utf-8');
    contents = JSON.parse(contents);
    sums = contents.checksums;
  }

  parse.loadDirectory('./topics', sums,  function(err, result) {
    parse.merge(contents, result, function(err, results) {

      fs.writeFile('./data.json', JSON.stringify(results), function (err) {
  		  console.log("Loaded");
      });
    });
  });
});

