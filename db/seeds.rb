location = [59.1350, 9.6]

unless User.where(email: 'user@test.no').first
  user = User.create(name: 'John Doe', email: 'user@test.no', password: 'test', password_confirmation: 'test')
  user.confirm!
  puts "created #{user.inspect} with password test"
end

unless Poi.where(location: location).first
  poi = Poi.create(location: location, category: 'estate_for_sale', title: 'funkisbolig', description: 'med fabuloso utsikt!', created_by: User.first)
  puts "created #{poi.inspect}"
end

unless Aoi.where(title: 'nabolaget').first
  locations = [[59.1370, 9.75],
               [59.1370, 9.5],
               [59.1340, 9.5],
               [59.1340, 9.75]]
  aoi = Aoi.create(locations: locations, categories: ['estate_for_sale'], title: 'nabolaget', user: User.first)
  puts "created #{aoi.inspect}"
end
