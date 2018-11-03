require './modules/validator.rb'
require './helpers/errors.rb'
require './entities/author.rb'
require './entities/book.rb'

author = Author.new('Andrei', '24-12-1998')
book = Book.new('New Book', author)
