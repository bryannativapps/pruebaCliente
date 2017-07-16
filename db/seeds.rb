# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Vehicle.find_or_create_by(:id => 1, :license_plate => 'ABC123', :color => "red", :year => "2017", :category_id => 1) #1
Vehicle.find_or_create_by(:id => 2, :license_plate => 'DFG321', :color => "blue", :year => "2016", :category_id => 2) #2

Passenger.find_or_create_by(:id => 1, :name => 'Bryan') #1
Passenger.find_or_create_by(:id => 2, :name => 'Nativapps') #2

Category.find_or_create_by(:id => 1, :name => 'ABC') #1
Category.find_or_create_by(:id => 2, :name => 'DFG') #2

Tour.find_or_create_by(:id => 1, :vehicle_id => 1, :passenger_id => 1, :from => "Barranquilla", :to => "Cartagena") #1
Tour.find_or_create_by(:id => 2, :vehicle_id => 1, :passenger_id => 2, :from => "Barranquilla", :to => "Bogota") #2
Tour.find_or_create_by(:id => 3, :vehicle_id => 2, :passenger_id => 1, :from => "Barranquilla", :to => "Cartagena") #3