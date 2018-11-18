module Validator
  include Errors

  def check_empty(var)
    raise EmptyObjectError if var.empty?
  end

  def check_instance(var, class_name)
    raise WrongClassError unless var.is_a? class_name
  end

  def check_quantity(var, quantity)
    raise OverQuantityError unless var.length >= quantity
  end
end
