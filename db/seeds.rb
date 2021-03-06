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
						:body => "<p>New Super Mario Bros. U is a Wii U game developed and published by Nintendo. It was released on November 18, 2012. It is the fourth game in the New Super Mario Bros. franchise and nearly the 200th game with a direct relation to the Mario franchise.
New Super Mario Bros. U was revealed initially as New Super Mario Bros. Mii, a demo experience during the unveiling of the Wii U at E3 2011 and was never confirmed to be an actual game. Later in the year, Nintendo announced that it was indeed a full title that would be shown again at E3 2012 as the new Mario game for the Wii U.</p>",
						:parent_id => nil,
						:space_id => "2")

Stiki::Page.create!(	:title => "Week 1",
						:slug => "week-1",
						:body => "<p>Week 1 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 2",
						:slug => "week-2",
						:body => "<p>Week 2 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 3",
						:slug => "week-3",
						:body => "<p>Week 3 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 4",
						:slug => "week-4",
						:body => "<p>Week 4 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 5",
						:slug => "week-5",
						:body => "<p>Week 5 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 6",
						:slug => "week-6",
						:body => "<p>Week 6 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 7",
						:slug => "week-7",
						:body => "<p>Week 7 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 9",
						:slug => "week-9",
						:body => "<p>Week 9 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 10",
						:slug => "week-10",
						:body => "<p>Week 10 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 11",
						:slug => "week-11",
						:body => "<p>Week 11 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")

Stiki::Page.create!(	:title => "Week 12",
						:slug => "week-12",
						:body => "<p>Week 12 teaching Information</p>",
						:parent_id => nil,
						:space_id => "3")


20.times do |i|
Stiki::Author.create!(	:user_id => "2",
						:authorable_id => i,
						:authorable_type => "Stiki::Page",
						:creator => "true")
end

