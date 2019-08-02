require 'yaml'

def load_library(file)
  library = {"get_emoticon" => {}, "get_meaning" => {}}
  YAML.load_file(file).each do |definition ,array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = definition
  end
  library
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  result = library["get_emoticon"][emoticon]
  if result
    result
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  result = library["get_meaning"][emoticon]
  if result
    result
  else
    return "Sorry, that emoticon was not found"
  end
end
