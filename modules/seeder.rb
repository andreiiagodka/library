require 'faker'

module Seeder
 def self.author
   Author.new(Faker::Book.author, Faker::Lorem.sentence)
 end

 def self.book
   Book.new(Faker::Book.title, author)
 end

 def self.reader
   Reader.new(
     Faker::Name.first_name, Faker::Internet.email,
     Faker::Address.city, Faker::Address.street_address, Faker::Address.building_number.to_i
   )
 end
end
