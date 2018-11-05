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

  def top_reader(quantity = 1)
    return unless are_entities_set(@readers) && over_quantity(@readers, quantity)

    hash_readers = set_readers_hash
    count_orders(hash_readers)
    output_readers(hash_readers, quantity)
  end

  protected

  def set_readers_hash
    hash = Hash.new
    @readers.each { |reader| hash.store(reader.name, 0)}
    hash
  end

  def count_orders(hash)
    @orders.each { |order|
      id = order.reader.name
      hash.each { |key, value| hash[key] = value + 1 if key == id }
    }
  end

  def output_readers(hash, quantity)
    sorted_hash = hash.sort_by(&:last).reverse.to_a
    endpoint = quantity - 1
    (0..endpoint).each { |key, value| puts "#{sorted_hash[key][0]}: #{sorted_hash[key][1]}" }
  end
end
