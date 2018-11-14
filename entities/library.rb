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
    entities_hash = { authors: @authors, books: @books, readers: @readers, orders: @orders }
    DB.load(entities_hash)
  end

  def add(entity)
    case entity
    when Author then @authors << entity
    when Book then @books << entity
    when Reader then @readers << entity
    when Order then @orders << entity
    else raise NotLibraryEntityError
    end
    DB.store(entity)
  end
end
