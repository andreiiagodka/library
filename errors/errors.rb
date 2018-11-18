module Errors
  class WrongClassError < StandardError
    def initialize(msg = 'Input is of wrong class!')
      super
    end
  end

  class EmptyObjectError < StandardError
    def initialize(msg = 'Input is empty!')
      super
    end
  end

  class OverQuantityError < StandardError
    def initialize(msg = 'There are no such quantity of entities!')
      super
    end
  end
end
