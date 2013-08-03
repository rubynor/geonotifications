location = [59.1356, 9.6]

unless Poi.where(location: location).first
  poi = Poi.create(location: location, category: 'estate_for_sale', title: 'funkisbolig', description: 'med fabuloso utsikt!')
  puts "created #{poi.inspect}"
end
