Rails.application.routes.draw do
  root 'homes#index'
  resources :homes, :only => [:index]
  resources :contacts do
    resources :comments
  end
  devise_for :admins
  devise_for :user_officers
  devise_for :user_students
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
