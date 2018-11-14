require 'pry'
class Reader
  include Validator

  attr_reader :name, :email, :city, :street, :house

  def initialize(name, email, city, street, house)
    address_hash = { city: city, street: street, house: house }
    return unless validate(name, email, address_hash)

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  protected

  def validate(name, email, address_hash)
    [name, email, address_hash[:city], address_hash[:street]].each do |data|
      check_string(data) && check_not_empty(data)
    end
    check_integer(address_hash[:house])
  end
end
