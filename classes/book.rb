class Book
  include Validator

  attr_accessor :title, :author

  def initialize(title, author)
    @title, @author = title, author if validate_string(title) && validate_instance(author, Author)
  end
end
