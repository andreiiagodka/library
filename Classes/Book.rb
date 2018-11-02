require './Modules/Validator.rb'
require './Classes/Author.rb'

class Book
  include Validator

  attr_accessor :title, :author

  def initialize(title, author)
    @title, @author = title, author if validate_string(title) && validate_instance(author, Author)
  end
end

author = Author.new('Andrei', '24-12-1998')
book = Book.new('New Book', author)
puts book.title
