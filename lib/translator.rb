require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  library = {"get_meaning" => {}, "get_emoticon" => {}}
  emoticons.each do |meaning,array|
    eng, jap = array
    library["get_emoticon"][eng] = jap
    library["get_meaning"][jap] = meaning
  end
  library
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  emoticon_hash["get_emoticon"].keys.include?(emoticon) ? emoticon_hash["get_emoticon"][emoticon] : "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  emoticon_hash["get_meaning"].keys.include?(emoticon) ? emoticon_hash["get_meaning"][emoticon] : "Sorry, that emoticon was not found"
end
