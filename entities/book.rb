class Book
  include Validator

  attr_reader :title, :author

  def initialize(title, author)
    return unless validate(title, author)

    @title = title
    @author = author
  end

  protected

  def validate(title, author)
    check_string(title) && check_not_empty(title) &&
      check_instance(author, Author)
  end
end
