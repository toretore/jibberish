# Jibberish
module Jibberish

  DEFAULT_FILENAME = File.join(RAILS_ROOT, 'public', 'javascripts', 'jibberish.js')

  def self.write(filename = DEFAULT_FILENAME)
    File.open(filename, 'w'){|file| file << combined }
  end

  def self.combined
    [jibberish,string_extensions,assign_locales_object,init].join("\n")
  end

  def self.jibberish
    File.read(File.join(File.dirname(__FILE__), 'javascripts', 'jibberish.js'))
  end

  def self.string_extensions
    File.read(File.join(File.dirname(__FILE__), 'javascripts', 'string_extensions.js'))
  end

  def self.assign_locales_object
    'Jibberish.locales = ' + locales_object + ';'
  end

  def self.init
    'Jibberish.initialize();'
  end

  def self.locales_object
    langs = {}
    Gibberish.languages.each do |lang|
      Gibberish.use_language lang do
        langs[lang] = Gibberish.translations
      end
    end
    langs.to_json
  end

end
