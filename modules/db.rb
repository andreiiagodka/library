module DB
  YAML_FILE_PATH = 'library_db.yaml'.freeze

  class << self
    def store(entity)
      File.open(YAML_FILE_PATH, 'a') { |file| file.write entity.to_yaml }
    end

    def load
      YAML.load_stream(File.read(YAML_FILE_PATH))
    end
  end
end
