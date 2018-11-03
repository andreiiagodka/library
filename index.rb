require './modules/validator.rb'
require './helpers/errors.rb'
require './entities/author.rb'
require './entities/book.rb'
require './entities/reader.rb'

author = Author.new('Andrei', '24-12-1998')
book = Book.new('New Book', author)
reader = Reader.new('Andrei', 'andrei.iagodka@gmail.com', 'Dnepr', 'Ruby Garage', 20)
