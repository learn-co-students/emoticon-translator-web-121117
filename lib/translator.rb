require "yaml"
require "pry"

def load_library(yml_file)
  file = YAML.load_file(yml_file)
  hold = {"get_meaning" => {}, "get_emoticon" => {}}
  file.each do |key,value|
    hold["get_meaning"][value[1]] = key
    hold["get_emoticon"][value[0]] = value[1]
  end
  hold
end

def get_japanese_emoticon(yml_file,emoticon)
  file = load_library(yml_file)
  hold = ""
  file["get_emoticon"].each do |key,value|
    if key == emoticon
      hold = value
      return hold
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(yml_file,emoticon)
  file = load_library(yml_file)
  hold = ""
  file["get_meaning"].each do |key,value|
    if key == emoticon
      hold = value
      return hold
    end
  end
  "Sorry, that emoticon was not found"
end
