module Validator
  def validate_string(string)
    is_string(string) && is_not_empty(string)
  end

  def validate_instance(var, class_name)
    is_instance_of(var, class_name)
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

  def is_instance_of(var, class_name)
    is_instance_of = var.instance_of? class_name
    puts NOT_INSTANCE unless is_instance_of
    is_instance_of
  end
end
