require_relative 'autoload.rb'

library = Library.new

puts library.top_readers(library.orders)
puts library.top_books(library.orders)
puts library.unique_readers_number(library.orders)
