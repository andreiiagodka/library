module DB
  YAML_FILE_PATH = 'library_db.yaml'.freeze

  class << self
    def store(entity)
      File.open(YAML_FILE_PATH, 'a') { |file| file.write entity.to_yaml }
    end

    def load(entities)
      records = YAML.load_stream(File.read(YAML_FILE_PATH))
      records.each do |record|
        case record
        when Author then entities[:authors] << record
        when Book then entities[:books] << record
        when Reader then entities[:readers] << record
        when Order then entities[:orders] << record
        end
      end
    end
  end
end
