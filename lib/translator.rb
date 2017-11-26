# require modules here
require "yaml"
def load_library(path = "./lib/emoticons.yml")
  library = YAML.load_file(path)
  translator = {"get_meaning" => {}, "get_emoticon" => {}}
  library.each do |word, array|
      translator["get_meaning"][array[1]] = word
      translator["get_emoticon"][array[0]] = array[1]
  end
  translator  
end

def get_japanese_emoticon(path, emoticon)
  translator = load_library(path)
  if translator["get_emoticon"][emoticon]
    return translator["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(path, emoticon)
  translator = load_library(path)
  if translator["get_meaning"][emoticon]
    return translator["get_meaning"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

#load_library("./lib/emoticons.yml")