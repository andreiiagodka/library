require 'date'

class Order
  include Validator

  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    return unless validate(book, reader, date)

    @book = book
    @reader = reader
    @date = date
  end

  protected

  def validate(book, reader, date)
    is_instance_of(book, Book) && is_instance_of(reader, Reader) && is_instance_of(date, Date)
  end
end
