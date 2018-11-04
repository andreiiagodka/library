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
