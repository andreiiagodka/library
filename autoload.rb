require 'require_all'
require 'date'
require 'faker'
require 'yaml'

require_relative './errors/errors'
require_relative './validation/validator'
require_relative './statistics/statistics'

require_all './modules'
require_all './entities'

require_relative './helpers/seed_db'
