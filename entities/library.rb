class Library
  include Validator
  include DB

  attr_reader :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books   = []
    @readers = []
    @orders  = []
    DB.load(@authors, @books, @readers, @orders)
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    end
    DB.store(entity)
  end

  def top_readers(quantity = 1)
    sort_hash(@readers, quantity)
  end

  def top_books(quantity = 1, output = true)
    sort_hash(@books, quantity, output)
  end

  def unique_readers_number(quantity = 3)
    books = top_books_array(quantity)
    output_unique_readers_number(books, @orders)
  end

  protected

  def sort_hash(entities, quantity, output = true)
    return unless validate_entity(entities, quantity)

    hash = create_statistic_hash(entities)
    sort_statistic_hash(hash, quantity, output)
  end

  def validate_entity(entity, quantity)
    are_entities_set(entity) && over_quantity(entity, quantity)
  end

  def create_statistic_hash(entities)
    hash = {}
    entities.each do |entity|
      entity_key = case entity
                   when Reader then entity.name
                   when Book then entity.title
                   end
      hash.store(entity_key, 0)
    end
    result_orders_statistic(hash, entities[0], @orders)
    hash
  end

  def result_orders_statistic(hash, entity, orders)
    orders.each do |order|
      id = case entity
           when Reader then order.reader.name
           when Book then order.book.title
           end
      hash.map { |key, value| hash[key] = value + 1 if key == id }
    end
  end

  def sort_statistic_hash(hash, quantity, output)
    sorted_hash = hash.sort_by(&:last).reverse.to_a
    output ? output_sorted_hash(sorted_hash, quantity) : sorted_hash
  end

  def output_sorted_hash(sorted_hash, quantity)
    (0...quantity).each do |key, _value|
      puts "#{sorted_hash[key][0]}: #{sorted_hash[key][1]}"
    end
  end

  def output_unique_readers_number(books, orders)
    readers = Set.new
    orders.each do |order|
      readers << order.reader.name if books.include? order.book.title
    end
    puts "Number of Readers of the Most Popular Books - #{readers.length}"
  end

  def top_books_array(quantity)
    books = []
    top_books(quantity, false).each { |book| books << book[0] }
    books
  end
end
