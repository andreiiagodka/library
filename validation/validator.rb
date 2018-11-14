module Validator
  def check_string(var)
    check_string = var.is_a? String

    begin
      raise NotStringError unless check_string

      check_string
    rescue NotStringError => e
      puts e.message
    end
  end

  def check_integer(var)
    check_integer = var.is_a? Integer

    begin
      raise NotIntegerError unless check_integer

      check_integer
    rescue NotIntegerError => e
      puts e.message
    end
  end

  def check_not_empty(var)
    check_not_empty = !var.empty?

    begin
      raise EmptyStringError unless check_not_empty

      check_not_empty
    rescue EmptyStringError => e
      puts e.message
    end
  end

  def check_instance(var, class_name)
    check_instance = var.instance_of? class_name

    begin
      raise NotInstanceError unless check_instance

      check_instance
    rescue NotInstanceError => e
      puts e.message
    end
  end

  def are_entities_set(var)
    are_entities_set = !var.empty?

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
