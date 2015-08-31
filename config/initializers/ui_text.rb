UISTORE = {}

I18n.backend = I18n::Backend::Chain.new(
  I18n::Backend::KeyValue.new(UISTORE), I18n.backend)

if ActiveRecord::Base.connection.table_exists? 'ui_text_entries'
  UiText::Entry.update_cache
end
