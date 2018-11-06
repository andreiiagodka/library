module Validator
  def is_string(var)
    is_string = var.is_a? String

    begin
      raise NotStringError unless is_string
      is_string
    rescue NotStringError => e
      puts e.message
    end
  end

  def is_integer(var)
    is_integer = var.is_a? Integer

    begin
      raise NotIntegerError unless is_integer
      is_integer
    rescue NotIntegerError => e
      puts e.message
    end
  end

  def is_not_empty(var)
    is_not_empty = !var.empty?

    begin
      raise EmptyStringError unless is_not_empty
      is_not_empty
    rescue EmptyStringError => e
      puts e.message
    end
  end

  def is_instance_of(var, class_name)
    is_instance_of = var.instance_of? class_name

    begin
      raise NotInstanceError unless is_instance_of
      is_instance_of
    rescue NotInstanceError => e
      puts e.message
    end
  end

  def are_entities_set(var)
    are_entities_set = var.length > 0

    begin
      raise NoEntitiesError unless are_entities_set
      are_entities_set
    rescue NoEntitiesError => e
      puts e.message
    end
  end

  def over_quantity(var, quantity)
    over_quantity = var.length >= quantity

    begin
      raise OverQuantityError unless over_quantity
      over_quantity
    rescue OverQuantityError => e
      puts e.message
    end
  end
end
