require 'date'
require 'faker'
require 'require_all'

require_all './modules'
require_all './helpers'
require_all './entities'

author = Author.new(Faker::Book.author, Faker::Lorem.sentence)

book_a = Book.new(Faker::Book.title, author)
book_b = Book.new(Faker::Book.title, author)
book_c = Book.new(Faker::Book.title, author)
book_d = Book.new(Faker::Book.title, author)

reader_a = Reader.new(
  Faker::Name.first_name, Faker::Internet.email,
  Faker::Address.city, Faker::Address.street_address, Faker::Address.building_number.to_i
)
reader_b = Reader.new(
  Faker::Name.first_name, Faker::Internet.email,
  Faker::Address.city, Faker::Address.street_address, Faker::Address.building_number.to_i
)
reader_c = Reader.new(
  Faker::Name.first_name, Faker::Internet.email,
  Faker::Address.city, Faker::Address.street_address, Faker::Address.building_number.to_i
)

order_a = Order.new(book_a, reader_a)
order_b = Order.new(book_b, reader_a)
order_c = Order.new(book_b, reader_b)
order_d = Order.new(book_b, reader_c)
order_e = Order.new(book_c, reader_a)
order_f = Order.new(book_c, reader_c)


library = Library.new

# library.add_author(author)

library.add_book(book_a)
library.add_book(book_b)
library.add_book(book_c)
library.add_book(book_d)

library.add_reader(reader_a)
library.add_reader(reader_b)

library.add_order(order_a)
library.add_order(order_b)
library.add_order(order_c)
library.add_order(order_d)
library.add_order(order_e)
library.add_order(order_f)

library.top_readers()
library.top_books()
library.readers_number()
