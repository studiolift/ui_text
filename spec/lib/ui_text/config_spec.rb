require 'rails_helper'

module UiText
  describe UiText::Config do
    it 'Configure backend' do
      foo = {}

      UiText.configure do |config|
        config.backend = foo
      end

      I18n.backend.store_translations('en',
        { x: 'y' }, escape: false)

      expect(foo['en.x']).to eq('"y"')

      expect(I18n.t('x')).to eq('y')
    end
  end
end
