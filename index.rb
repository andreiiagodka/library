require 'date'
require './modules/validator.rb'
require './helpers/errors.rb'
require './entities/author.rb'
require './entities/book.rb'
require './entities/reader.rb'
require './entities/order.rb'
require './entities/library.rb'

author = Author.new('Andrei', '24-12-1998')

book   = Book.new('New Book', author)

reader = Reader.new('Andrei', 'andrei.iagodka@gmail.com', 'Dnepr', 'Street', 20)

order  = Order.new(book, reader)

library = Library.new()
library.add_author(author)
library.add_book(book)
library.add_reader(reader)
library.add_order(order)
puts library.orders.length
