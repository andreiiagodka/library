require './Helpers/Validator.rb'

class Author
  attr_accessor :name, :biography

  def initialize(name, biography)
    @name, @biography = name, biography
  end

  def self.store(name, biography = nil)
    if Validator.validate(name, ['string', 'not empty'])
      puts 'Author stored successfully!'
      self.new(name, biography)
    else
      Validator.error
    end
  end

end

author = Author.store('Andrei', '24-12-1998')
puts author
