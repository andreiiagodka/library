require './classes/author.rb'
require './classes/book.rb'
require './modules/validator.rb'
require './helpers/errors.rb'

author = Author.new('author', '24-12-1998')
puts author

book = Book.new('Book', 'Andrei')
puts book
