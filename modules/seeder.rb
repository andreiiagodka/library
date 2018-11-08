module Seeder
  class << self
    def author
      Author.new(Faker::Book.author, Faker::Lorem.sentence)
    end

    def book
      Book.new(Faker::Book.title, author)
    end

    def reader
      Reader.new(
        Faker::Name.first_name, Faker::Internet.email,
        Faker::Address.city, Faker::Address.street_address, Faker::Address.building_number.to_i
      )
    end
  end
end
