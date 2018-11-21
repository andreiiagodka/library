require_relative 'autoload.rb'

library = Library.new

library.top_readers(library.orders)
library.top_books(library.orders)
library.unique_readers_number(library.orders)
