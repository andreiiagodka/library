require 'require_all'
require 'date'
require 'faker'
require 'yaml'

require_all './modules'
require_all './helpers'
require_all './entities'

library = Library.new

puts library.top_readers
puts library.top_books
puts library.unique_readers_number
