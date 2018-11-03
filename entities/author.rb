class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name, biography = nil)
    return unless validate(name)
    @name = name
    @biography = biography
  end

  protected

  def validate(name)
    is_string(name) && is_not_empty(name)
  end
end
