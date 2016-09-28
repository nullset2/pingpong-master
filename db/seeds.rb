['inigo', 'edrizio'].each do |u|
  User.create!(email: "#{u}@regalii.com", name: u, password: 'secret123')
end
puts "-- Added 2 users to your database"
