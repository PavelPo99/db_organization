Rails.application.routes.draw do
  root "publications#index"

  resources :articles
  resources :book_chapters
  resources :reports
end
