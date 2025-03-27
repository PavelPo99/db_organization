Rails.application.routes.draw do
  root "home#show"

  resources :articles
  resources :book_chapters
  resources :reports
end
