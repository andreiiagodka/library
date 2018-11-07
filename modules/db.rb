require 'pry'
module DB
  YAML_FILE_PATH = 'library_db.yaml'

  def self.store(entity)
    File::open(YAML_FILE_PATH, 'a') { |f| f.write entity.to_yaml }
  end

  def self.load
    records = YAML.load_stream(File::read(YAML_FILE_PATH))
    records.each { |record| binding.pry }
  end
end
