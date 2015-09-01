UiText::Engine.routes.draw do
  scope ":locale", constraints: { locale: /(#{I18n.available_locales.join('|')})/ } do
    resources :entries, path: '/', except: [:new, :edit], param: :key, constraints: { key: /[A-z0-9.]+/ } do
      member do
        post :create
      end
    end
  end

  root to: redirect(I18n.default_locale.to_s)
end
