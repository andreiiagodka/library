module Validator
  def is_string(var)
    is_string = var.is_a? String

    begin
      raise NotStringError unless is_string
    rescue NotStringError => e
      puts e.message
    end

    is_string
  end

  def is_integer(var)
    is_integer = var.is_a? Integer

    begin
      raise NotIntegerError unless is_integer
    rescue NotIntegerError => e
      puts e.message
    end

    is_integer
  end

  def is_not_empty(var)
    is_not_empty = !var.empty?

    begin
      raise EmptyStringError unless is_not_empty
    rescue EmptyStringError => e
      puts e.message
    end

    is_not_empty
  end

  def is_instance_of(var, class_name)
    is_instance_of = var.instance_of? class_name

    begin
      raise NotInstanceError unless is_instance_of
    rescue NotInstanceError => e
      puts e.message
    end

    is_instance_of
  end
end
