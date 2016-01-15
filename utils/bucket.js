var fs = require("fs");
var _ = require("underscore");
var async = require("async");
var clusterfck = require("clusterfck");
var pos = require("pos");
var dict = require("./dict")('./nounBucket.json');
var w2v = require('word2vec');


var fileContents = fs.readFileSync("sample.txt", "utf-8");
w2v.loadModel("./vectors.txt", function(err, model){
  console.log("Loaded");

  if (fileContents) {
    var fileArray = fileContents.split("\n");
    var part = fileArray.slice(0,100);

    var itor = function(line, cb) {
      var input = line.trim();

      if ( input !== "") {
        var wordArray = new pos.Lexer().lex(line);
        var taggedArray = new pos.Tagger().tag(wordArray);
        var nouns = taggedArray.filter(function(word){ return ["NN", "NNS", "NNP", "NNPS"].indexOf(word[1]) != -1 });
        nouns = nouns.map(function(item){ return item[0]});
        if (!_.isEmpty(nouns)) {
          var wordVecs = model.getVectors(nouns);
          cb(null, wordVecs);
        } else {
          cb(null, []);
        }
      } else {
        cb(null, []);
      }
    };

    async.map(part, itor, function(err, res){
      var superSet = [];
      for (var x in res) {
        var line = res[x];
        for (var i = 0; i < line.length; i++) {
          superSet.push(line[i].values);
        }
      }

      // var clusters = clusterfck.kmeans(superSet, 10);
      var clusters = clusterfck.hcluster(superSet);
      console.log(clusters);
      // for (var i = 0; i < clusters.length; i++) {
        // console.log("Cluster " + (i + 1) + "\n");
        // for (var n = 0; n < clusters[i].length; n++) {
        //   var nw = model.getNearestWord(clusters[i][n]);
        //   console.log(nw);
        // }
      // }

      dict.save();
      process.exit(1);
    });
  }
});

