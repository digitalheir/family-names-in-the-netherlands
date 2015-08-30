require 'nokogiri'
require 'open-uri'
require 'csv'

offset = 0

# Write CSV file with scraped contents of Meertens website
CSV.open('family_names_in_the_netherlands.csv', 'w+') do |csv|
  csv << ['family name', 'number in 2007', 'lemma']
  loop do
    names = []
    doc = Nokogiri::HTML open("http://www.meertens.knaw.nl/nfb/lijst_namen.php?offset=#{offset}&naam=.%2A&treffers=322126&operator=rx")

    # Add names to array
    doc.at_css('#hitlist').css('tr').each do |row|
      # puts "rows: #{doc.at_css('#hitlist').css('tr').size}"
      cells = []
      row.css('td').each do |cell|
        cells << cell.text.strip
        if cells.length == 1
          anchor = ''
          a = cell.at_css('a')
          if a
            anchor = a['href']
          end
          cells << anchor
        end
      end
      if cells.length == 4
        names << cells
      else
        if cells.length != 0
          puts "WARNING: #{cells}"
        end
      end
    end
    offset+=50
    puts "Found #{names.length} names"
    if names.length <= 0
      break
    else
      names.each do |name|
        csv << name
      end
      # if offset >= 2_000
      #   break
      # end
    end
  end
end