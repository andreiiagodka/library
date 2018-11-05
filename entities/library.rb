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
    return unless validate_entity(@readers, quantity)

    hash_readers = create_hash(@readers)
    count_orders(hash_readers, 'reader')
    output_sorted_hash(hash_readers, quantity)
  end

  def top_books(quantity = 1)
    return unless validate_entity(@books, quantity)

    hash_books = create_hash(@books)
    count_orders(hash_books, 'book')
    output_sorted_hash(hash_books, quantity)
  end

  protected

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

  def output_sorted_hash(hash, quantity)
    sorted_hash = hash.sort_by(&:last).reverse.to_a
    endpoint = quantity - 1
    
    (0..endpoint).each do |key, _value|
      puts "#{sorted_hash[key][0]}: #{sorted_hash[key][1]}"
    end
  end
end
