module UiText
  class Entry < ActiveRecord::Base
    validates :locale, :key, :value, presence: true

    after_save :update_cache

    after_destroy do |record|
      UISTORE.delete("#{record.locale}.#{record.key}")
      update_cache
    end

    def self.update_cache
      all.each do |e|
        if e.value?
          I18n.backend.store_translations(
            e.locale, { e.key => e.value }, escape: false)
        end
      end
    end

    def update_cache
      self.class.update_cache
    end

    def to_param
      key
    end
  end
end
