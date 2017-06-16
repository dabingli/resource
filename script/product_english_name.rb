file = File.open(File.join(Rails.root, 'script', ARGV[0] ))
count = 0
puts 'Input Price Data Start'
puts 'Wait...'
dictionary = {}
file.each do |line| 
  array = line.force_encoding("UTF-8").split(",")
  puts array[0]
  dictionary[array[0]] = array[1]
  count += 1
  puts "#{count} rows"
end

Product.includes(:product_languages).all.each do |record|
  pl = record.language_record(2)
  if pl.name.blank? && dictionary[record.name]
    pl.name = dictionary[record.name]
    pl.save
  end
end

file.close
puts 'Done.'
