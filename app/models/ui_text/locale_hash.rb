module UiText
  class LocaleHash
    attr_reader :files, :locale

    def initialize(locale: 'en', files: locale_files)
      @locale = locale
      @files  = files
    end

    def to_h
      files.map { |f|
        HashKeys.flat_key_map yaml(f)
      }.reduce({}, :merge)
    end

    private

    def locale_files
      Dir.glob("#{Rails.root}/config/locales/*.yml")
    end

    def yaml(file)
      YAML.load(File.open(file))[locale.to_s]
    end
  end
end
