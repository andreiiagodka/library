module Statistics
  def top_readers(orders, quantity = 1)
    get_top_entities(orders, :reader, quantity)
  end

  def top_books(orders, quantity = 1)
    get_top_entities(orders, :book, quantity)
  end

  def unique_readers_number(orders, quantity = 3)
    top_books = top_books(orders, quantity)
    orders.select { |order| top_books.include? order.book }.uniq.size
  end

  private

  def get_top_entities(orders, group_param, quantity)
    orders.group_by(&group_param).sort_by { |_, order| -order.size }.first(quantity).to_h.keys
  end
end
