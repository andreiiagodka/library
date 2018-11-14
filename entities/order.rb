class Order
  include Validator

  attr_reader :book, :reader, :date

  def initialize(book, reader, date = Date.today)
    validate(book, reader, date)

    @book = book
    @reader = reader
    @date = date
  end

  private

  def validate(book, reader, date)
    check_instance(book, Book)
    check_instance(reader, Reader)
    check_instance(date, Date)
  end
end
