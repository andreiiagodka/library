require 'date'
require 'faker'
require 'require_all'

require_all './modules'
require_all './helpers'
require_all './entities'

author = Author.new(Faker::Book.author, Faker::Lorem.sentence)

book = Book.new(Faker::Book.title, author)

reader = Reader.new(
  Faker::Name.first_name, Faker::Internet.email,
  Faker::Address.city, Faker::Address.street_address, Faker::Address.building_number.to_i
)

order = Order.new(book, reader)

library = Library.new
library.add_author(author)
library.add_book(book)
library.add_reader(reader)
library.add_order(order)
