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

  def top_readers(quantity = 1)
    sort_hash(@readers, quantity)
  end

  def top_books(quantity = 1, output = nil)
    sort_hash(@books, quantity, output)
  end

  def readers_number(quantity = 3)
    books = top_books_array(quantity)
    output_unique_readers_number(books)
  end

  protected

  def sort_hash(entities, quantity, output = nil)
    return unless validate_entity(entities, quantity)

    hash = create_hash(entities)
    sorted_hash(hash, quantity, output)
  end

  def validate_entity(entity, quantity)
    are_entities_set(entity) && over_quantity(entity, quantity)
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

    count_orders(hash, entities[0])
    hash
  end

  def count_orders(hash, entity)
    @orders.each do |order|
      case entity
      when Reader then id = order.reader.name
      when Book then id = order.book.title
      end

      hash.each { |key, value| hash[key] = value + 1 if key == id }
    end
  end

  def sorted_hash(hash, quantity, output)
    sorted_hash = hash.sort_by(&:last).reverse.to_a

    output ? sorted_hash : output_sorted_hash(sorted_hash, quantity)
  end

  def output_sorted_hash(sorted_hash, quantity)
    endpoint = quantity - 1

    (0..endpoint).each do |key, _value|
      puts "#{sorted_hash[key][0]}: #{sorted_hash[key][1]}"
    end
  end

  def top_books_array(quantity)
    books = []
    top_books(quantity, true).each { |book| books << book[0] }

    books
  end

  def output_unique_readers_number(books)
    readers = Set.new
    @orders.each do |order|
      readers << order.reader.name if books.include? order.book.title
    end

    puts readers.length
  end
end
