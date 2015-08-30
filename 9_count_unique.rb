require 'set'
require 'csv'

unique=Set.new

CSV.foreach('family_names_in_the_netherlands.csv') do |row|
  unless row == ['family_name', 'href', 'number in 2007', 'lemma']
    if unique.include? row
      puts "Double: #{row}"
    end
    unless row.length == 4
      puts row
    end
    unique << row
  end
end

puts unique.size