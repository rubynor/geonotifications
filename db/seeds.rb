location = [59.1356, 9.6]

unless User.where(email: 'user@test.no').first
  user = User.create(name: 'John Doe', email: 'user@test.no', password: 'test', password_confirmation: 'test')
  user.confirm!
  puts "created #{user.inspect} with password test"
end

unless Poi.where(location: location).first
  poi = Poi.create(location: location, category: 'estate_for_sale', title: 'funkisbolig', description: 'med fabuloso utsikt!', created_by: User.first)
  puts "created #{poi.inspect}"
end
