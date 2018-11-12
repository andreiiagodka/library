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
    get_statistics(@orders, 'reader', quantity)
  end

  def top_books(quantity = 1)
    get_statistics(@orders, 'book', quantity)
  end

  def unique_readers_number(quantity = 3)
    top_books = get_statistics(@orders, 'book', quantity)
    top_books.map!(&:title)
    readers = @orders.map! { |order| order.reader.name if top_books.include? order.book.title }
    readers.compact.size
  end

  protected

  def get_statistics(orders, group_param, quantity)
    return unless validate_orders(orders, quantity)

    sort_orders(orders, group_param, quantity).to_h.keys
  end

  def validate_orders(entity, quantity)
    are_entities_set(entity) && over_quantity(entity, quantity)
  end

  def sort_orders(orders, group_param, quantity)
    grouped_orders =
      case group_param
      when 'reader' then orders.group_by(&:reader)
      when 'book' then orders.group_by(&:book)
      end
    grouped_orders.sort_by { |_param, order| -order.size }.first(quantity)
  end
end
