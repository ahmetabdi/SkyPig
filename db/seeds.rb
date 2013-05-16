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
						:body => "<p>Tom Cruise stars in Oblivion, an original and groundbreaking cinematic event from the director of TRON: Legacy and the producer of Rise of the Planet of the Apes.
						On a spectacular future Earth that has evolved beyond recognition, one mans confrontation with the past will lead him on a journey of redemption and discovery as he battles to save mankind.
						Jack Harper (Cruise) is one of the last few drone repairmen stationed on Earth.
						Part of a massive operation to extract vital resources after decades of war with a terrifying threat known as the Scavs, Jacks mission is nearly complete.
						Living in and patrolling the breathtaking skies from thousands of feet above, his soaring existence is brought crashing down when he rescues a beautiful stranger from a downed spacecraft.
						Her arrival triggers a chain of events that forces him to question everything he knows and puts the fate of humanity in his hands.</p>",
						:parent_id => nil,
						:space_id => "1")

Stiki::Page.create!(	:title => "Iron Man 3",
						:slug => "oblivion",
						:body => "<p>The brash-but-brilliant industrialist Tony Stark/Iron Man is faced against an enemy whose reach knows no bounds.
						When Stark finds his personal world destroyed at his enemys hands, he embarks on a harrowing quest to find those responsible.
						This journey, at every turn, will test his mettle. With his back against the wall, Stark is left to survive by his own devices, relying on his ingenuity and instincts to protect those closest to him.
						As he fights his way back, Stark discovers the answer to the question that has secretly haunted him: does the man make the suit or does the suit make the man</p> <br />
						<img alt='Tnww0otzn5hf7egdiqnfpebevg4' src='http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w154/tNww0oTzn5hf7EgDIqnfpEbEVG4.jpg'>
						<img alt='N9x2dkitl3v0yq1q1jrk8z5uaki' src='http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w154/n9X2DKItL3V0yq1q1jrk8z5UAki.jpg'>
						<img alt='7ies3srae6zg1k7rahnhnq7skut' src='http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w154/7IES3SRAe6ZG1K7rAhnhnQ7sKuT.jpg'>
						<img alt='Xdl0jfthehbikchtarqogpoop0e' src='http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w154/xdL0JfthEHBikCHtARqOGPoOp0e.jpg'>
						<img alt='Qckzx808u4pfil9gls2k3qu0vsp' src='http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w154/qCkzx808u4PFIL9GLS2K3qU0VSp.jpg'>
						<img alt='Nnhvsxosmputb7wqucvnlkubigd' src='http://d3gtl9l2a4fn1j.cloudfront.net/t/p/w154/nnhVsXOSMpUTB7WquCVnlKUbigD.jpg'>",
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