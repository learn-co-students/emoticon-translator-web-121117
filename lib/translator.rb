require "yaml"

def load_library(path)
    emoticons = YAML.load_file(path)
    library = {"get_meaning" => {}, "get_emoticon" => {}}
    emoticons.each do |word, array|
        library["get_meaning"][array[1]] = word
        library["get_emoticon"][array[0]] = array[1]
    end
    library
end

def get_japanese_emoticon(path, emoticon)
    translator = load_library(path)
    if translator["get_emoticon"][emoticon]
        translator["get_emoticon"][emoticon]
        else
        "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(path, emoticon)
    translator = load_library(path)
    if translator["get_meaning"][emoticon]
        translator["get_meaning"][emoticon]
        else
        "Sorry, that emoticon was not found"
    end
end
