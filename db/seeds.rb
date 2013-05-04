# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#

# Rails Environment Configuration.

#Admin Account
User.create!( :username => "admin", 
              :email => "admin@skypig.com",
              :password => "skypig",
              :password_confirmation => "skypig")
#Normal User
User.create!( :username => "ahmet_test", 
              :email => "ahmet@skypig.com",
              :password => "google555",
              :password_confirmation => "google555")

#Stiki wiki Population
Stiki::Space.create!(	:name => "Movies",
              			:slug => "movies")  

Stiki::Space.create!(	:name => "Games",
              			:slug => "games")  

Stiki::Space.create!(	:name => "Teaching Material",
              			:slug => "teaching-material")

Stiki::Page.create!(	:title => "Oblivion",
						:slug => "oblivion",
						:body => "<p> Upcoming movie Oblivion </p>",
						:parent_id => nil,
						:space_id => "1")

Stiki::Page.create!(	:title => "Mario Brothers",
						:slug => "mario-brothers",
						:body => "<p>Mario Brothers</p>",
						:parent_id => nil,
						:space_id => "2")

Stiki::Page.create!(	:title => "Week 1",
						:slug => "week-1",
						:body => "<p>Week 1 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Author.create!(	:user_id => "2",
						:authorable_id => "1",
						:authorable_type => "Stiki::Page",
						:creator => "true")

Stiki::Author.create!(	:user_id => "2",
						:authorable_id => "2",
						:authorable_type => "Stiki::Page",
						:creator => "true")

Stiki::Author.create!(	:user_id => "2",
						:authorable_id => "3",
						:authorable_type => "Stiki::Page",
						:creator => "true")