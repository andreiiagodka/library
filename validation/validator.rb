module Validator
  include Errors

  def check_string(var)
    raise WrongClassError unless var.is_a? String
  end

  def check_integer(var)
    raise WrongClassError unless var.is_a? Integer
  end

  def check_empty(var)
    raise EmptyObjectError if var.empty?
  end

  def check_instance(var, class_name)
    raise NotInstanceError unless var.instance_of? class_name
  end

  def check_quantity(var, quantity)
    raise OverQuantityError unless var.length >= quantity
  end
end
