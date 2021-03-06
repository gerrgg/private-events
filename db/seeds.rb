# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: 'greg', email: 'greg@drunk.kiwi')

10.times do |n|
    User.create!(name: Faker::Games::WorldOfWarcraft.hero,
                 email: Faker::Internet.email )
end

User.all.each do |user| 
    user.events.create!(title: Faker::Marketing.buzzwords,
                        description: Faker::Movies::HarryPotter.quote,
                        event_date: Faker::Date.between(6.months.ago, 6.months.from_now),
                        location: Faker::Movies::HarryPotter.location )
    event = Event.find(rand(Event.count) + 1)
    user.rsvps.create!( attended_event_id: event.id )
end
