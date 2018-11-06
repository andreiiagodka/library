class NotStringError < StandardError
  def initialize(msg = 'Input is not a string!')
    super
  end
end

class NotIntegerError < StandardError
  def initialize(msg = 'Input is not an integer!')
    super
  end
end

class EmptyStringError < StandardError
  def initialize(msg = 'Input is empty!')
    super
  end
end

class NotInstanceError < StandardError
  def initialize(msg = 'Input is not an instance of necessary class!')
    super
  end
end

class NoEntitiesError < StandardError
  def initialize(msg = 'There are no required entities!')
    super
  end
end

class OverQuantityError < StandardError
  def initialize(msg = 'There are no such quantity of entities!')
    super
  end
end
