var get_2007 = require('./table_2007');

var startUrl = 'http://www.meertens.knaw.nl/nfb/detail_naam.php?info=kaart2007&t=abs&zw=regexp&gba_naam=van+der+berg&nfd_naam=Berg%2C+van+de+%2F+den+%2F+der&operator=eq&taal=eng#kaartweergave';



get_2007.createDoc(
    url,
    function (docs) {
        console.log(docs);
    }
);