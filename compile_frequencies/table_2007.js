var http = require('http');
var cheerio = require('cheerio');

var obj = {
    download: function (url, callback) {
        http.get(url, function (res) {
            res.setEncoding('utf-8');
            var data = "";
            res.on('data', function (chunk) {
                data += chunk;
            });
            res.on("end", function () {
                callback(data);
            });
        }).on("error", function (e) {
            console.error("Got error with " + name + ": " + e.message);
        });
    },

    getDocFromDataFunction: function (name, id, callback) {
        return function (data) {
            var $ = cheerio.load(data);
            var $trs = $('#data > table tr');

            var counts = {};
            for (var i = 0; i < $trs.length; i++) {
                var tr = $trs[i];
                var cell1 = $($(tr).find('td:nth-child(1)')[0]).text().trim();
                var cell2 = $($(tr).find('td:nth-child(2)')[0]).text().trim();

                if (cell1.length > 0) {
                    if (counts[cell1]) {
                        console.error(cell1, "was already filled.");
                        throw new Error(cell1 + " was already filled.");
                    }

                    counts[cell1] = cell2;
                }
            }
            var doc = {
                _id: id,
                counts: counts
            };
            callback(doc);
        }
    },

    getId: function (name) {
        return "1947_" + name;
    },

    createDoc: function (name, url, callback) {
        this.download(url, this.getDocFromDataFunction(name, this.getId(name), callback));
    }
};

module.exports = obj;