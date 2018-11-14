module Statistics
  def top_readers(orders, quantity = 1)
    get_statistics(orders, 'reader', quantity)
  end

  def top_books(orders, quantity = 1)
    get_statistics(orders, 'book', quantity)
  end

  def unique_readers_number(orders, quantity = 3)
    top_books = get_statistics(orders, 'book', quantity).map!(&:title)
    orders.select { |order| order.reader.name if top_books.include? order.book.title }.compact.size
  end

  private

  def get_statistics(orders, group_param, quantity)
    validate_orders(orders, quantity)

    sort_orders(orders, group_param, quantity).to_h.keys
  end

  def validate_orders(entity, quantity)
    check_empty(entity)
    check_quantity(entity, quantity)
  end

  def sort_orders(orders, group_param, quantity)
    grouped_orders =
      case group_param
      when 'reader' then orders.group_by(&:reader)
      when 'book' then orders.group_by(&:book)
      end
    grouped_orders.sort_by { |_, order| -order.size }.first(quantity)
  end
end
