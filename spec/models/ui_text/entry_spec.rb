require 'rails_helper'

module UiText
  describe Entry, type: :model do
    describe 'locale' do
      it 'column' do
        expect(Entry.columns_hash['locale'].type).to eq(:string)
      end

      it 'presence' do
        entry = Entry.new
        entry.save
        expect(entry.errors.messages[:locale]).to eq(["can't be blank"])
      end
    end

    describe 'key' do
      it 'column' do
        expect(Entry.columns_hash['key'].type).to eq(:string)
      end

      it 'presence' do
        entry = Entry.new
        entry.save
        expect(entry.errors.messages[:key]).to eq(["can't be blank"])
      end
    end

    describe 'value' do
      it 'column' do
        expect(Entry.columns_hash['value'].type).to eq(:text)
      end

      it 'presence' do
        entry = Entry.new
        entry.save
        expect(entry.errors.messages[:value]).to eq(["can't be blank"])
      end
    end
  end
end
