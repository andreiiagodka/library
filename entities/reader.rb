class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    return unless validate(name, email, city, street, house)
    
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  protected

  def validate(name, email, city, street, house)
    is_string(name) && is_not_empty(name) &&
    is_string(email) && is_not_empty(email) &&
    is_string(city) && is_not_empty(city) &&
    is_string(street) && is_not_empty(street) &&
    is_integer(house)
  end
end
