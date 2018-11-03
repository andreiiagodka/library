class Author
  include Validator

  attr_accessor :name, :biography

  def initialize(name, biography = nil)
    @name, @biography = name, biography if validate_string(name)
  end
end
