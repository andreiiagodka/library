class Library
  include Statistics
  include Validator
  include DB

  attr_reader :authors, :books, :readers, :orders

  def initialize
    @authors = []
    @books   = []
    @readers = []
    @orders  = []
    DB.load(@authors, @books, @readers, @orders)
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    end
    DB.store(entity)
  end
end
