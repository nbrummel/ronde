# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users = [{:email => 'nnn@gmail.com', :password => 'foobaraa', :password_confirmation => 'foobaraa', :first_name => 'nn', :last_name => 'yy'},
		{:email => 'a@gmail.com', :password => 'foobaraa', :password_confirmation => 'foobaraa', :first_name => 'an', :last_name => 'ay'},
		{:email => 'b@gmail.com', :password => 'foobaraa', :password_confirmation => 'foobaraa', :first_name => 'bn', :last_name => 'by'},
		{:email => 'c@gmail.com', :password => 'foobaraa', :password_confirmation => 'foobaraa', :first_name => 'cn', :last_name => 'cy'},
		{:email => 'd@gmail.com', :password => 'foobaraa', :password_confirmation => 'foobaraa', :first_name => 'dn', :last_name => 'dy'}
	]

users.each do |user|
	User.create!(user)
end