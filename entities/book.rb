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
    check_instance(title, String)
    check_empty(title)
    check_instance(author, Author)
  end
end
