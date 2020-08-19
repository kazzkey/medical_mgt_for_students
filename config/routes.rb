Rails.application.routes.draw do
  root 'homes#index'
  get 'login', to: 'login#index'
  resources :homes, :only => [:index]
  resources :contacts do
    resources :comments
  end
  devise_for :admins
  devise_for :user_officers
  devise_for :user_students
  resources :user_students, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
