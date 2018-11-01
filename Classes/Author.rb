require './Modules/Validator.rb'

class Author
  include Validator

  attr_accessor :name, :biography

  def initialize(name, biography = nil)
    puts validate_name(name)
    @name, @biography = name, biography
  end

  protected

  def validate_name(name)
    is_string(name) && is_not_empty(name)
  end
end

author = Author.new('Andrei', '24-12-1998')
puts author
