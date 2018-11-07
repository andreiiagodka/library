require 'require_all'

require_all './modules'
require_all './helpers'
require_all './entities'

author_a = Seeder.author
author_b = Seeder.author
author_c = Seeder.author

book_a = Seeder.book
book_b = Seeder.book
book_c = Seeder.book
book_d = Seeder.book
book_e = Seeder.book

reader_a = Seeder.reader
reader_b = Seeder.reader
reader_c = Seeder.reader

order_a = Order.new(book_a, reader_a)
order_b = Order.new(book_b, reader_a)
order_c = Order.new(book_d, reader_a)
order_d = Order.new(book_b, reader_c)
order_e = Order.new(book_c, reader_a)
order_f = Order.new(book_c, reader_c)
order_g = Order.new(book_e, reader_b)
order_h = Order.new(book_a, reader_c)
order_i = Order.new(book_e, reader_a)

library = Library.new

library.add(author_a)
library.add(author_b)
library.add(author_c)

library.add(book_a)
library.add(book_b)
library.add(book_c)
library.add(book_d)
library.add(book_e)

library.add(reader_a)
library.add(reader_b)
library.add(reader_c)

library.add(order_a)
library.add(order_b)
library.add(order_c)
library.add(order_d)
library.add(order_e)
library.add(order_f)
library.add(order_g)
library.add(order_h)
library.add(order_i)

# library.top_readers()
# library.top_books()
# library.unique_readers_number()
