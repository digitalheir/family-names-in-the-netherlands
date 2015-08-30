Family names in the Netherlands
-------------------------------

This project exists to make structured, machine readable data out of the [Meertens Dutch Family Name Database](http://www.meertens.knaw.nl/nfb/), which contains about 320000 last names that were recorded in 2007 as well as in 1947.

We scrape the Meertens website to generate a CSV file that contains: the family name, the number of times it was counted in 2007, and name as lemma (meaning the 'base' version names that has multiple variants, e.g. `Jansen` is the lemma for both `Janﬂen` and `Jansen`).

We then apply some formatting. Mainly, we add a column for the 'natural name', which transforms a name such as `Veld, in 't` to `in 't Veld`. The resulting file is [`family_names_in_the_netherlands_with_natural_name.csv`](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/family_names_in_the_netherlands_with_natural_name.csv), which is also uploaded as a [Fusion Table](). Note that the list still contains some strange cases, such as `in 'tVeld` (missing space) and `van 0s` (with the number 0 instead of the letter O), but we do not attempt to correct these.
 
We also create an alphabetic lookup list of all family names in the database, which is available in [`family_names.lst`](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/family_names.lst).

Example
=======
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
 
License
=======
Code is available under [MIT License](https://github.com/digitalheir/family-names-in-the-netherlands/blob/master/LICENSE.txt)
Data is available under [CC-0 License](http://creativecommons.org/publicdomain/zero/1.0/)

More information 
================
|Source|URL|
|---|---|
|Dutch name (Wikipedia)|https://en.wikipedia.org/wiki/Dutch_name|
|Meertens Dutch Family Name Database|http://www.meertens.knaw.nl/nfb/|