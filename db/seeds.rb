# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
puts 'Creating main admin'
admin = Admin.create! :nick => 'Khin', :email => 'nicolas.benkemoun@gmail.com', :password => 'Norway2015', :password_confirmation => 'Norway2015', :activate => 1
puts 'Success!'
