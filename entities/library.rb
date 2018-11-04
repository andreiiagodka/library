class Library
  include Validator

  attr_reader :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books   = []
    @readers = []
    @orders  = []
  end

  def add_author(author)
    @authors << author if is_instance_of(author, Author)
  end

  def add_book(book)
    @books << book if is_instance_of(book, Book)
  end

  def add_reader(reader)
    @readers << reader if is_instance_of(reader, Reader)
  end

  def add_order(order)
    @orders << order if is_instance_of(order, Order)
  end
end
