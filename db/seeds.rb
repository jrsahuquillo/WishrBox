# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['Sahu', 'Carlos', 'Alvaro', 'Filipa', 'Daichi', 'Simon', 'Miguel Angel', 'Juan Pablo', 'Diana', 'Mariano']
domain = ['gmail.com', 'mail.com', 'hotmail.com', 'yahoo.es']

10.times do |i|
	name = names[i]
  date1 = 25.years.ago
  date2 = 30.years.ago
  birthdate = Time.at((date2.to_f - date1.to_f)*rand + date1.to_f)
	user = User.create!({ name: name, email: name.gsub(/\s+/, "").downcase+"@"+domain[rand(domain.length)], birthday: birthdate, preferences: "#{name} preferences" })
end
