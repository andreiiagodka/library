module Validator
  include Errors

  def check_empty(argument)
    raise EmptyObjectError if argument.empty?
  end

  def check_instance(argument, class_name)
    raise WrongClassError unless argument.is_a? class_name
  end

  def check_quantity(argument, quantity)
    raise OverQuantityError unless argument.length >= quantity
  end
end
