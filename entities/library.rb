require 'set'

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

  def top_readers(qty = 1)
    sort_hash(@readers, 'reader', qty)
  end

  def top_books(qty = 1, output = nil)
    sort_hash(@books, 'book', qty, output)
  end

  def readers_number(qty = 3)
    books = top_books_array(qty)
    puts unique_readers(books).length
  end

  protected

  def sort_hash(entities, entity, qty, output = nil)
    return unless validate_entity(entities, qty)

    hash_books = create_hash(entities)
    count_orders(hash_books, entity)
    output_sorted_hash(hash_books, qty, output)
  end

  def validate_entity(entity, qty)
    are_entities_set(entity) && over_qty(entity, qty)
  end

  def create_hash(entities)
    hash = {}
    entities.each do |entity|
      case entity
      when Reader then entity_key = entity.name
      when Book then entity_key = entity.title
      end

      hash.store(entity_key, 0)
    end

    hash
  end

  def count_orders(hash, entity_name)
    @orders.each do |order|
      case entity_name
      when 'reader' then id = order.reader.name
      when 'book' then id = order.book.title
      end

      hash.each { |key, value| hash[key] = value + 1 if key == id }
    end
  end

  def output_sorted_hash(hash, qty, output)
    sorted_hash = hash.sort_by(&:last).reverse.to_a
    endpoint = qty - 1

    if output == 'hash'
      sorted_hash
    else
      (0..endpoint).each do |key, _value|
        puts "#{sorted_hash[key][0]}: #{sorted_hash[key][1]}"
      end
    end
  end

  def top_books_array(qty)
    books = []
    top_books(qty, 'hash').each { |book| books << book[0] }
    books
  end

  def unique_readers(books)
    readers = Set.new
    @orders.each do |order|
      readers << order.reader.name if books.include? order.book.title
    end
    readers
  end
end
