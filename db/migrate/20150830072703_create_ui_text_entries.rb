class CreateUiTextEntries < ActiveRecord::Migration
  def change
    create_table :ui_text_entries do |t|
      t.string :locale
      t.string :key
      t.text :value

      t.timestamps null: false
    end
  end
end
