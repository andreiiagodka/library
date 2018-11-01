class Validator

  ERROR_MSG = 'Validation error! Check your input.'

  def self.validate(variable, parameters)
    parameters.map { |param| break false unless case_param(variable, param) }
  end

  def self.error
    puts self::ERROR_MSG
  end

  protected

  def self.case_param(variable, param)
    case param
    when 'string' then is_string(variable)
    when 'not empty' then is_not_empty(variable)
    end
  end

  def self.is_string(variable)
    variable.is_a? String
  end

  def self.is_not_empty(variable)
    !variable.empty?
  end
end

# name = 'Andrei'
# validator = Validator.validate(name, ['string', 'not empty'])
# puts validator
