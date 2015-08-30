require 'csv'

rows = []

top = 1_000
CSV.foreach('family_names_in_the_netherlands_with_natural_name.csv') do |row|
  begin
    unless row[3] == 'count in 2007'
      count = Integer(row[3].gsub(/\./, ''))
      rows << [row[0], row[1], row[2], count, row[4]]
    end
  rescue
    unless row[3] == '< 5'
      puts "could not parse #{row[3]}"
    end
  end
end

puts "Considering #{rows.length} rows"

CSV.open("top_#{top}_last_names_in_the_netherlands_2007.csv", 'w+') do |csv|
  rows.sort_by { |row| -Integer(row[3]) }[0..(top-1)].each do |row|
    csv << row
  end
end
