require 'csv'

DONT_REMOVE_SPACE_FOR_PREFIXES = [
    /^'s$/,
    /^[vV]an$/,
    /^[Ii]n$/,
    /^auf$/,
    /^de$/,
    /^t$/,
    /^s'$/,
]
DONT_CORRECT_NAMES = [
    /Hare Koninklijke Hoogheid M.xima, Prinses der Nederlanden, Prinses van Oranje-Nassau, Mevrouw van Amsberg/,
    /SpielmannRita Spielmann-Preses, geb\. 4-6-1906, won\./
]
csv = []
i=0
CSV.foreach('family_names_in_the_netherlands.csv') do |row|
  if row[-4..-1] == ['family_name', 'href', 'number in 2007', 'lemma']
    # Do nothing
    i+=1
  elsif i == 0
    raise "#{i} ??? #{row[-4..-1].to_s} != [\"family_name\", \"href\", \"number in 2007\", \"lemma\"]: #{row[-4..-1] != ['family_name', 'href', 'number in 2007', 'lemma']}"
  else
    db_name = row[0].force_encoding('utf-8').strip
    href = row[1].force_encoding('utf-8').strip
    if href and href.length>0
      href = "http://meertens.knaw.nl/nfb/#{href}"
    end
    count = row[2].force_encoding('utf-8').strip
    lemma = row[3].force_encoding('utf-8').strip

    natural_name = db_name
    if DONT_CORRECT_NAMES.map { |reg| db_name.match reg }.reduce(false) { |a, b| a or b }
      puts ">Not changing: #{db_name}"
    else
      if db_name.scan(/,/).length > 0

        if db_name.scan(/,/).length > 1 and ![
            'Oranje-Nassau, Van Vollenhoven, van',
            'Oldenbarneveld, genaamd Witte Tullingh, van',
            'Oldenbarneveld,genaamd Witte Tullingh, van',
            'Oranje-Nassau, Van Vollenhoven, van',
            'Wetering, bijgenaamd de Rooij, van de',
            'Heuvel tot Beichlingen, gezegd Bartolotti Rijnders, van den',
            'Horst, bijgenaamd Linders, van der',
            'Horst,bijgenaamd Linders, van der',
            'Thije, Ook Genoemd Boonkkamp, ten',
            'Thije, ook Genoemd Boonkkamp, ten',
            'Thije, ook genoemd Boonkkamp, ten',
            'Thije,ook genoemd Boonkkamp, ten',
            'Oosten, zich noemende Heijkoop, van \'t',
        ].include? db_name
          puts "...Take a look at #{db_name}"
        end


        prefix = db_name.match(/,([^,]*)$/)[1].strip # Take the part after the final comma: this is the prefix (e.g. 'van de')

        space = ' '
        if prefix.match /[^\p{L}]$/ or db_name.match /^[^\p{L}]/
          if DONT_REMOVE_SPACE_FOR_PREFIXES.map { |reg| prefix.match reg }.reduce(false) { |a, b| a or b }
            puts ">Writing #{prefix.strip} #{db_name.gsub(/,[^,]*$/, '').strip} instead of #{prefix.strip}#{db_name.gsub(/,[^,]*$/, '').strip}"
          else
            unless prefix.strip.match /A|[Dd]'|[Ll]'|El|de [Ll]'/
              puts "Writing #{prefix.strip}#{db_name.gsub(/,[^,]*$/, '').strip} instead of #{prefix.strip} #{db_name.gsub(/,[^,]*$/, '').strip}"
              if prefix.strip.length > 2
                puts "Take a look at #{db_name}"
              end
            end
            space = ''
          end
        end
        natural_name = "#{prefix.strip}#{space}#{db_name.gsub(/,[^,]*$/, '').strip}"
      end
    end
    # if [natural_name, db_name, href, count, lemma] == ['', '', '', '0', '']
    #   puts "#{[natural_name, db_name, href, count, lemma]} ??? #{row}"
    # end
    csv << [natural_name, db_name, href, count, lemma]
  end
  i+=1
  # if i%50000==0
  #   puts i
  # end
end

# Sort and write rows
CSV.open('family_names_in_the_netherlands_with_natural_name.csv', 'w+') do |csv_f|
  csv_f << ['natural name', 'meertens db name', 'href', 'count in 2007', 'lemma']
  csv.sort_by { |row| row[0] }.each do |row|
    csv_f << row
  end
end
