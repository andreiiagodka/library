module Validator
  def is_string(var)
    begin
      raise NotStringError unless var.is_a? String
    rescue NotStringError => e
      puts e.message
    end
  end

  def is_not_empty(var)
    begin
      raise EmptyStringError unless !var.empty?
    rescue EmptyStringError => e
      puts e.message
    end
  end

  def is_instance_of(var, class_name)
    begin
      raise NotInstanceError unless var.instance_of? class_name
    rescue NotInstanceError => e
      puts e.message
    end
  end
end
