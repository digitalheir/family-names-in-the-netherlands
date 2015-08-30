# Family names in the Netherlands


This project exists to make structured, machine readable data out of the [Meertens Dutch Family Name Database](http://www.meertens.knaw.nl/nfb/), which contains about 320000 last names that were recorded in 2007 as well as in 1947.

We scrape the Meertens website to generate a CSV file that contains: the family name, the number of times it was counted in 2007, and name as lemma (meaning the 'base' version names that has multiple variants, e.g. `Jansen` is the lemma for both `Janﬂen` and `Jansen`).

We then apply some formatting. Mainly, we add a column for the 'natural name', which transforms a name such as `Veld, in 't` to `in 't Veld`. The resulting file is [`family_names_in_the_netherlands_with_natural_name.csv`](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/family_names_in_the_netherlands_with_natural_name.csv), which is also uploaded as a [Fusion Table](). We also create an alphabetic lookup list of all family names in the database, which is available in [`family_names.lst`](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/family_names.lst).

Note that the list still contains some strange cases, such as `in 'tVeld` (missing space) and `van 0s` (with the number 0 instead of the letter O), but we do not attempt to correct these.
 


## Example
Below are some (a-)typical examples or rows you'd find in the [`family_names_in_the_netherlands_with_natural_name.csv`](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/family_names_in_the_netherlands_with_natural_name.csv) file.

|natural name|meertens db name|href|count in 2007|lemma|
|------------|----------------|----|-------------|-----|
|Jansen|Jansen|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=jansen&gba_naam=Jansen&nfd_naam=Jansen&operator=rx&taal=)|73.533|Jansen|
|Janﬂen|Janﬂen|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=jan%C3%9Fen&gba_naam=Jan%C3%9Fen&nfd_naam=Jansen&operator=rx&taal=)|< 5|Jansen|
|Trompeter|Trompeter|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=trompeter&gba_naam=Trompeter&nfd_naam=Trompeter&operator=rx&taal=)|0|Trompeter|
|Trompetter|Trompetter|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=trompetter&gba_naam=Trompetter&nfd_naam=Trompetter&operator=rx&taal=)|457|Trompetter|
|Trompper|Trompper|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=trompper&gba_naam=Trompper&nfd_naam=Trompper&operator=rx&taal=)|37|Trompper|
|Trompslager|Trompslager|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=trompslager&gba_naam=Trompslager&nfd_naam=Trompslager&operator=rx&taal=)|0|Trompslager|
|TrompÈ|TrompÈ|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=tromp%C3%A9&gba_naam=Tromp%C3%A9&nfd_naam=Trompe+%28%C3%A9%29&operator=rx&taal=)|6|Trompe (È)|
|Hare Koninklijke Hoogheid M·xima, Prinses der Nederlanden, Prinses van Oranje-Nassau, Mevrouw van Amsberg|Hare Koninklijke Hoogheid M·xima, Prinses der Nederlanden, Prinses van Oranje-Nassau, Mevrouw van Amsberg||< 5||
|Prinses der Nederlan Hare Koninklijke Hoogheid M·xima|Hare Koninklijke Hoogheid M·xima, Prinses der Nederlan|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=Prinses+der+Nederlanden%2C+Prinses+van+Oranje-Nassau%2C+Mevrouw+van+Amsberg+hare+koninklijke+hoogheid+m%C3%A1xima&gba_naam=Prinses+der+Nederlanden%2C+Prinses+van+Oranje-Nassau%2C+Mevrouw+van+Amsberg+Hare+Koninklijke+Hoogheid+M%C3%A1xima&nfd_naam=Hare+Koninklijke+Hoogheid+M%C3%A1xima%2C+Prinses+der+Nederlanden%2C+Prinses+van+Oranje-Nassau%2C+Mevrouw+van+Amsberg&operator=rx&taal=)|0|Hare Koninklijke Hoogheid M·xima, Prinses der Nederlanden, Prinses van Oranje-Nassau, Mevrouw van Amsberg|
|Van 't Veld|Veld, Van 't|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+%27t+veld&gba_naam=Van+%27t+Veld&nfd_naam=Veld%2C+van+%27t&operator=rx&taal=)|< 5|Veld, van 't|
|van 't Veld|Veld, van 't|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+%27t+veld&gba_naam=van+%27t+Veld&nfd_naam=Veld%2C+van+%27t&operator=rx&taal=)|431|Veld, van 't|
|van 't Veldt|Veldt, van 't|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+%27t+veldt&gba_naam=van+%27t+Veldt&nfd_naam=Veldt%2C+van+%27t&operator=rx&taal=)|37|Veldt, van 't|
|van 't Velt|Velt, van 't|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+%27t+velt&gba_naam=van+%27t+Velt&nfd_naam=Velt%2C+van+%27t&operator=rx&taal=)|17|Velt, van 't|
|van 't Oosten, zich noemende Heijkoop|Oosten, zich noemende Heijkoop, van 't|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+%27t+oosten%2C+zich+noemende+heijkoop&gba_naam=van+%27t+Oosten%2C+zich+noemende+Heijkoop&nfd_naam=&operator=rx&taal=)|6||
|??obi?ska|??obi?ska||< 5||
 
### Top 50 last names in the Netherlands
|natural name|meertens db name|href|count in 2007|lemma|
|------------|----------------|----|-------------|-----|
|de Jong|Jong, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+jong&gba_naam=de+Jong&nfd_naam=Jong%2C+de&operator=rx&taal=)|83782|Jong, de|
|Jansen|Jansen|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=jansen&gba_naam=Jansen&nfd_naam=Jansen&operator=rx&taal=)|73533|Jansen|
|de Vries|Vries, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+vries&gba_naam=de+Vries&nfd_naam=Vries%2C+de&operator=rx&taal=)|71065|Vries, de|
|van den Berg|Berg, van den|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+den+berg&gba_naam=van+den+Berg&nfd_naam=Berg%2C+van+de+%2F+den+%2F+der&operator=rx&taal=)|57377|Berg, van de / den / der|
|van Dijk|Dijk, van|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+dijk&gba_naam=van+Dijk&nfd_naam=Dijk%2C+van+%28y%29&operator=rx&taal=)|56408|Dijk, van (y)|
|Bakker|Bakker|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=bakker&gba_naam=Bakker&nfd_naam=Bakker&operator=rx&taal=)|55273|Bakker|
|Janssen|Janssen|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=janssen&gba_naam=Janssen&nfd_naam=Janssen&operator=rx&taal=)|54040|Janssen|
|Visser|Visser|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=visser&gba_naam=Visser&nfd_naam=Visser&operator=rx&taal=)|49525|Visser|
|Smit|Smit|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=smit&gba_naam=Smit&nfd_naam=Smit&operator=rx&taal=)|42275|Smit|
|Meijer|Meijer|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=meijer&gba_naam=Meijer&nfd_naam=Meijer+%28y%29&operator=rx&taal=)|38472|Meijer (y)|
|de Boer|Boer, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+boer&gba_naam=de+Boer&nfd_naam=Boer%2C+de&operator=rx&taal=)|38191|Boer, de|
|Mulder|Mulder|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=mulder&gba_naam=Mulder&nfd_naam=Mulder&operator=rx&taal=)|36207|Mulder|
|de Groot|Groot, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+groot&gba_naam=de+Groot&nfd_naam=Groot%2C+de&operator=rx&taal=)|36032|Groot, de|
|Bos|Bos|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=bos&gba_naam=Bos&nfd_naam=Bos&operator=rx&taal=)|35402|Bos|
|Vos|Vos|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=vos&gba_naam=Vos&nfd_naam=Vos&operator=rx&taal=)|30279|Vos|
|Peters|Peters|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=peters&gba_naam=Peters&nfd_naam=Peters&operator=rx&taal=)|30106|Peters|
|Hendriks|Hendriks|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=hendriks&gba_naam=Hendriks&nfd_naam=Hendriks&operator=rx&taal=)|29492|Hendriks|
|Dekker|Dekker|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=dekker&gba_naam=Dekker&nfd_naam=Dekker&operator=rx&taal=)|27946|Dekker|
|van Leeuwen|Leeuwen, van|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+leeuwen&gba_naam=van+Leeuwen&nfd_naam=Leeuwen%2C+van&operator=rx&taal=)|27819|Leeuwen, van|
|Brouwer|Brouwer|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=brouwer&gba_naam=Brouwer&nfd_naam=Brouwer&operator=rx&taal=)|25419|Brouwer|
|de Wit|Wit, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+wit&gba_naam=de+Wit&nfd_naam=Wit%2C+de&operator=rx&taal=)|24055|Wit, de|
|Dijkstra|Dijkstra|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=dijkstra&gba_naam=Dijkstra&nfd_naam=Dijkstra+%28y%29&operator=rx&taal=)|23510|Dijkstra (y)|
|Smits|Smits|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=smits&gba_naam=Smits&nfd_naam=Smits&operator=rx&taal=)|23205|Smits|
|de Graaf|Graaf, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+graaf&gba_naam=de+Graaf&nfd_naam=Graaf%2C+de&operator=rx&taal=)|21004|Graaf, de|
|van der Meer|Meer, van der|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+der+meer&gba_naam=van+der+Meer&nfd_naam=Meer%2C+van+de+%2F+der&operator=rx&taal=)|20591|Meer, van de / der|
|Kok|Kok|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=kok&gba_naam=Kok&nfd_naam=Kok&operator=rx&taal=)|20325|Kok|
|Jacobs|Jacobs|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=jacobs&gba_naam=Jacobs&nfd_naam=Jacobs&operator=rx&taal=)|20148|Jacobs|
|van der Linden|Linden, van der|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+der+linden&gba_naam=van+der+Linden&nfd_naam=Linden%2C+van+der&operator=rx&taal=)|20132|Linden, van der|
|Vermeulen|Vermeulen|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=vermeulen&gba_naam=Vermeulen&nfd_naam=Vermeulen&operator=rx&taal=)|20110|Vermeulen|
|de Haan|Haan, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+haan&gba_naam=de+Haan&nfd_naam=Haan%2C+de&operator=rx&taal=)|20011|Haan, de|
|van den Heuvel|Heuvel, van den|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+den+heuvel&gba_naam=van+den+Heuvel&nfd_naam=Heuvel%2C+van+den&operator=rx&taal=)|19899|Heuvel, van den|
|van den Broek|Broek, van den|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+den+broek&gba_naam=van+den+Broek&nfd_naam=Broek%2C+van+de+%2F+den+%2F+der&operator=rx&taal=)|18447|Broek, van de / den / der|
|van der Veen|Veen, van der|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+der+veen&gba_naam=van+der+Veen&nfd_naam=Veen%2C+van+de+%2F+der&operator=rx&taal=)|18366|Veen, van de / der|
|de Bruin|Bruin, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+bruin&gba_naam=de+Bruin&nfd_naam=Bruin%2C+de&operator=rx&taal=)|17593|Bruin, de|
|Schouten|Schouten|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=schouten&gba_naam=Schouten&nfd_naam=Schouten&operator=rx&taal=)|17147|Schouten|
|van Beek|Beek, van|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+beek&gba_naam=van+Beek&nfd_naam=Beek%2C+van&operator=rx&taal=)|16708|Beek, van|
|van der Heijden|Heijden, van der|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+der+heijden&gba_naam=van+der+Heijden&nfd_naam=Heijden%2C+van+der+%28y%29&operator=rx&taal=)|16663|Heijden, van der (y)|
|de Bruijn|Bruijn, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+bruijn&gba_naam=de+Bruijn&nfd_naam=Bruijn%2C+de+%28y%29&operator=rx&taal=)|16562|Bruijn, de (y)|
|Willems|Willems|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=willems&gba_naam=Willems&nfd_naam=Willems&operator=rx&taal=)|16508|Willems|
|van Vliet|Vliet, van|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+vliet&gba_naam=van+Vliet&nfd_naam=Vliet%2C+van&operator=rx&taal=)|16346|Vliet, van|
|Maas|Maas|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=maas&gba_naam=Maas&nfd_naam=Maas&operator=rx&taal=)|15620|Maas|
|Hoekstra|Hoekstra|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=hoekstra&gba_naam=Hoekstra&nfd_naam=Hoekstra&operator=rx&taal=)|15613|Hoekstra|
|Verhoeven|Verhoeven|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=verhoeven&gba_naam=Verhoeven&nfd_naam=Verhoeven&operator=rx&taal=)|15525|Verhoeven|
|Koster|Koster|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=koster&gba_naam=Koster&nfd_naam=Koster&operator=rx&taal=)|15346|Koster|
|van Dam|Dam, van|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=van+dam&gba_naam=van+Dam&nfd_naam=Dam%2C+van&operator=rx&taal=)|15288|Dam, van|
|Prins|Prins|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=prins&gba_naam=Prins&nfd_naam=Prins&operator=rx&taal=)|14894|Prins|
|Huisman|Huisman|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=huisman&gba_naam=Huisman&nfd_naam=Huisman&operator=rx&taal=)|14682|Huisman|
|Blom|Blom|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=blom&gba_naam=Blom&nfd_naam=Blom&operator=rx&taal=)|14679|Blom|
|Peeters|Peeters|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=peeters&gba_naam=Peeters&nfd_naam=Peeters&operator=rx&taal=)|14054|Peeters|
|de Jonge|Jonge, de|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=de+jonge&gba_naam=de+Jonge&nfd_naam=Jonge%2C+de&operator=rx&taal=)|13989|Jonge, de|
|Kuipers|Kuipers|[link](http://meertens.knaw.nl/nfb/detail_naam.php?gba_lcnaam=kuipers&gba_naam=Kuipers&nfd_naam=Kuipers&operator=rx&taal=)|13987|Kuipers|

 
## License
Code is available under [MIT License](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/LICENSE.txt)
Data is available under [CC-0 License](http://creativecommons.org/publicdomain/zero/1.0/)

## More information
|Source|URL|
|---|---|
|Dutch name (Wikipedia)|https://en.wikipedia.org/wiki/Dutch_name|
|Meertens Dutch Family Name Database|http://www.meertens.knaw.nl/nfb/|