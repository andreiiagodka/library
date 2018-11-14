class Book
  include Validator

  attr_reader :title, :author

  def initialize(title, author)
    validate(title, author)

    @title = title
    @author = author
  end

  private

  def validate(title, author)
    check_string(title)
    check_not_empty(title)
    check_instance(author, Author)
  end
end
