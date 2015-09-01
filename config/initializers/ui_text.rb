UiText.configure do |config|
  config.backend = {}
end

if ActiveRecord::Base.connection.table_exists? 'ui_text_entries'
  UiText::Entry.update_cache
end
