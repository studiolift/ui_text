module UiText
  class Config
    attr_reader :backend

    def initialize
      @backend = {}
    end

    def backend=(value)
      I18n.backend = I18n::Backend::Chain.new(
        I18n::Backend::KeyValue.new(value), I18n.backend)

      @backend = value
    end
  end

  class << self
    attr_accessor :config
  end

  @config = Config.new

  def self.configure
    yield config
  end
end
