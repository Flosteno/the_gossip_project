require 'faker'


[Recipient, PrivateMessage, GossipTag, Tag, Gossip, User, City].each(&:destroy_all)

ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='cities'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='users'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='gossips'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='tags'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='gossip_tags'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='private_messages'")
ActiveRecord::Base.connection.execute("DELETE FROM sqlite_sequence WHERE name='recipients'")


# Cities
cities = 10.times.map do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

puts "10 villes ont été crées"

# Users
users = 10.times.map do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(18..70),
    city: cities.sample
  )
end

User.create!(first_name: "Anonymous", last_name: "R", description: Faker::Lorem.paragraph, email: "anonymous@mail.com", age: 33, city: cities.sample)

puts "10+1 utilisateurs ont été crées"

# Gossips
gossips = 20.times.map do
  Gossip.create!(
    title: Faker::Book.title[0...14],
    content: Faker::Lorem.paragraph,
    user: users.sample
  )
end

puts "20 Gossips ont été crées"

# Tags
tags = 10.times.map do
  Tag.create!(
    title: "#" + Faker::Hobby.activity.downcase.gsub(/\s+/, "_")
  )
end

puts "10 tags ont été crées"


# GossipTags
gossips.each do |gossip|
  gossip.tags << tags.sample(rand(1..3))
end



# Private Messages
5.times do
  sender = users.sample
  recipients = users.sample(rand(1..3))
  pm = PrivateMessage.create!(content: Faker::Quote.famous_last_words, sender: sender)
  recipients.each { |u| Recipient.create!(private_message: pm, user: u) }
end

puts "Des messages privées ont été crées"