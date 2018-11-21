class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name, biography = nil)
    validate(name)

    @name = name
    @biography = biography
  end

  private

  def validate(name)
    check_instance(name, String)
    check_empty(name)
  end
end
