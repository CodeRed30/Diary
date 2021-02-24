Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  resources 'entries'
  get "*missing" => redirect("/")

  authenticated :user do
    root to: 'welcome#index', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')
end
