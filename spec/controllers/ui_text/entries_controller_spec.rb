require 'rails_helper'

module UiText
  describe EntriesController, type: :controller do
    routes do
      UiText::Engine.routes
    end

    it "GET #index" do
      get :index, locale: :en
      expect(response.status).to eq(200)
      # Locale keys are in the dummy app
      expect(assigns[:entries].map(&:key)).to match_array(['another', 'foo.bar', 'hello'])
    end

    it "POST #create" do
      post :create, locale: :en, key: 'foo', entry: { value: 'bar' }
      expect(response).to redirect_to(entries_path(locale: 'en'))
    end

    describe "GET #show" do
      it "Initialize" do
        get :show, locale: :en, key: 'foo'
        expect(assigns[:entry].key).to eq('foo')
      end

      it "Exists" do
        get :show, locale: :en, key: 'foo'
        expect(assigns[:entry].key).to eq('foo')
      end

      it "Bad key" do
        get :show, locale: :en, key: 'foo'
        expect(assigns[:entry].key).to eq('foo')
      end
    end

    it "PATCH #update" do
      Entry.create! locale: 'en', key: 'foo', value: 'x'
      patch :update, locale: :en, key: 'foo', entry: { value: 'bar' }
      expect(response).to redirect_to(entries_path(locale: 'en'))
    end

    it "PATCH #update without a value deletes record" do
      Entry.create! locale: 'en', key: 'foo', value: 'x'
      patch :update, locale: :en, key: 'foo', entry: { value: '' }
      expect(response).to redirect_to(entries_path(locale: 'en'))
      expect(Entry.count).to eq(0)
    end

    it "DELETE destroy" do
      Entry.create! locale: 'en', key: 'foo', value: 'x'
      delete :destroy, locale: :en, key: 'foo'
      expect(response).to redirect_to(entries_path(locale: 'en'))
      expect(Entry.count).to eq(0)
    end
  end
end
