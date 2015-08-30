rows = []
CSV.foreach('family_names_in_the_netherlands_with_natural_name.csv') do |row|
  begin
    count=Integer()
    rows << row
  rescue
    puts "could not parse #{row[3]}"
  end
end

CSV.open('top_1000_last_names_in_the_netherlands_2007.csv', 'w+') do |csv|
  csv.sort_by { |row| row[0] }.each do |row|
    csv << row
  end
end
