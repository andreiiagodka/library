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
    load_from_db
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    else raise WrongClassError
    end
    DB.store(entity)
  end

  private

  def load_from_db
    DB.load.each { |record| add(record) }
  end
end
