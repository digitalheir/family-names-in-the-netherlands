var http = require('http');
var cheerio = require('cheerio');
var fs = require('fs');
var slugify = require('slugify');
var base64_encode = require('base64').encode;

var re = /document\.getElementById\('.*'\)\.alt='.*';/g;
var re2 = /document\.getElementById\(('.*')\)\.alt=('.*');/;
//var had = new Set();

function get_count_table(data) {
    var table = {};
    var matches = data.match(re);
    if (matches) {
        for (var m_i = 0; m_i < matches.length; m_i++) {
            var line = matches[m_i];
            var name = eval(line.match(re2)[1]);
            var count = eval(line.match(re2)[2]).substring(name.length).trim().match(/\(([0-9]+)\)/)[1];
            if (table[name]) {
                console.error("WARNING: " + name + " already had value " + table[name]);
            }
            table[name] = count;
        }
    }
    return table;
}

function download(url, callback) {
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
}

function getInfoUrls($) {
    var $2007 = $('div#verspreiding2 b').filter(function () {
        return (/2007/).test($(this).text())
    });

    var $1947 = $('div#verspreiding2 b').filter(function () {
        return (/1947/).test($(this).text())
    });
}

function handle_all_names($) {
    var urls = getInfoUrls($);

    var $kaartinfo = $('table#kaartinfo');

    var doc = {};
    var name_s = $('b', $kaartinfo).text().trim();
    doc['name'] = name_s;
    var base64 = base64_encode(name_s);
    doc['base64'] = base64;
    var firstletter = name_s[0].toUpperCase();
    if (!firstletter.match(/\p{L}/)) {
        firstletter = "_";
    } else {
        firstletter = slugify(firstletter);
    }
    //var path = firstletter + "/" + base64 + "/";
    //
    //fs.writeFile(path + "/doc.json", doc, function (err) {
    //    if (err) {
    //        return console.error(err);
    //    }
    //});
    console.log(doc);
}


function handleName(name) {
    var href = "detail_naam.php?nfd_naam=" + encodeURIComponent(name);
    var url = "http://www.meertens.knaw.nl/nfb/" + href;

    // Get page
    download(url, function (data) {

        var $ = cheerio.load(data);

        handle_all_names($, doc);
    });
}
//    content = doc.at_css('div#content')
//
//    derivatives, derivative_of = get_network(content.at_css('#netwerk'), name)
//
//    old_count = get_1947_count(name)
//
//    new_count = []
//    spread_table = content.at_css('div#verspreiding2').elements.first
//    unless
//    spread_table.css('b').first.text.strip == '2007'
//    raise
//    "Expected #{spread_table.css('b').first.text.strip} to be '2007'"
//    end
//    spread_table.css('tr').each
//    do |row |
//    passed_totaal = false
//    cell_no = -1
//    row.css('td').each
//    do |cell |
//    alternate_name = nil
//    alternate_count = nil
//    alternate_href = nil
//    cell_no += 1
//    if cell.text.split.length <= 0
//        break
//    else
//        case
//    cell_no
//    when
//    0
//    alternate_name = cell.text.strip
//    when
//    1
//    alternate_count = cell.text.strip
//    when
//    2
//    if cell.at_css('a')
//        alternate_href = cell.at_css('a')['href']
//    end
//else
//    end
//    end
//    alternate = {
//        name: alternate_name, total: alternate_count, href: alternate_href
//    }
//    if alternate_href
//        alternate[
//:
//    count
//]
//    = get_2007_count(alternate_href)
//    end
//    new_count << alternate
//    if alternate_name == 'totaal'
//        passed_totaal = true
//    end
//    end
//    if (passed_totaal)
//        break
//    end
//    end
//    unless
//    new_count['totaal']
//    raise
//    "No totaal number found for #{name}"
//    end
//
//    map = content.at_css('map#gemeentes')
//    path = "details/#{name[0]}/#{name}"
//    FileUtils.mkpath
//    path
//
//
//    File.write("#{path}/doc.json", JSON.pretty_generate({
//        _id: name,
//        count_1947: old_count,
//        count_2007: new_count,
//        derivative_of: derivative_of,
//        derivatives: derivatives
//    }).force_encoding('utf-8'))
//    File.open("#{path}/index.html", 'w+')
//    do |f |
//    f.puts
//    '<html><body>'
//    f.puts
//    map.to_s
//    f.puts
//    '</body></html>'
//    end
//    File.open("#{path}/README.md", 'w+')
//    do |f |
//    f.puts
//    ""
//    end

var names = ["Jansen", "Janssen", "Hannes"];
for (var names_i = 0; names_i < names.length; names_i++) {
    var name = names[names_i].trim();
    handleName(name);
}