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
    is_string(title) && is_not_empty(title) &&
    is_instance_of(author, Author)
  end
end
