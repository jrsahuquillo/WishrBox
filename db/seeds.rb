# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ['Sahu', 'Carlos', 'Alvaro', 'Filipa', 'Daichi', 'Simon', 'Miguel Angel', 'Juan Pablo', 'Diana', 'Mariano']
domain = ['gmail.com', 'mail.com', 'hotmail.com', 'yahoo.es']
wishes = ['iPhone 7', 'iPad 2 Air', 'MackBook Pro', 'Apple TV', 'MacBook Air', 'Apple Watch', 'Earpods', 'Apple Music', 'iPod touch', 'Mac mini' ]


10.times do |i|
	name = names[i]
  date1 = 25.years.ago
  date2 = 30.years.ago
  birthdate = Time.at((date2.to_f - date1.to_f)*rand + date1.to_f)
	wish = wishes[i]

	user = User.create!({
		name: name,
		email: name.gsub(/\s+/, "").downcase+"@"+domain[rand(domain.length)],
		password: '12345678',
		password_confirmation:'12345678',
		birthday: birthdate.strftime("%d-%m-%Y"),
		preferences: "#{name} preferences"
		})

	user.wishes.create!({
		title: wish,
		description: "The very best #{wish} ever in the world",
		link: 'http://apple.com'
		})

end
