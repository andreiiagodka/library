module Validator
  def is_string(var)
    var.is_a? String
  end

  def is_not_empty(var)
    !var.empty?
  end
end
