Rails.application.routes.draw do
  devise_for :user_officers
  devise_for :user_students
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
