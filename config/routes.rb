UiText::Engine.routes.draw do
  scope "(:locale)", locale: /(en)/ do
    resources :entries, except: [:new, :edit], param: :key, constraints: { key: /[A-z0-9.]+/ } do
      member do
        post :create
      end
    end
  end
end
