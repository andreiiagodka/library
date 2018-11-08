module DB
  YAML_FILE_PATH = 'library_db.yaml'

  class << self
    def store(entity)
      File.open(YAML_FILE_PATH, 'a') { |file| file.write entity.to_yaml }
    end

    def load(authors, books, readers, orders)
      records = YAML.load_stream(File.read(YAML_FILE_PATH))
      records.each { |record|
        case record
        when Author then authors << record
        when Book then books << record
        when Reader then readers << record
        when Order then orders << record
        end
      }
    end
  end
end
