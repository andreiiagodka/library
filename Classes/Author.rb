class Author
  attr_accessor :name, :biography

  def initialize(name, biography)
    @name, @biography = name, biography
  end

  def self.store(name, biography)
    self.new(name, biography)
  end
end

author = Author.store('Andrei', '24-12-1998')
puts author
