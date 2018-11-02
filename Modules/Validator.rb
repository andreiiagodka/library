require './Helpers/Errors.rb'

module Validator
  def validate_string(var)
    is_string(var) && is_not_empty(var)
  end

  protected

  def is_string(var)
    is_string = var.is_a? String
    puts NOT_STRING unless is_string
    is_string
  end

  def is_not_empty(var)
    is_not_empty = !var.empty?
    puts EMPTY_STRING unless is_not_empty
    is_not_empty
  end
end
