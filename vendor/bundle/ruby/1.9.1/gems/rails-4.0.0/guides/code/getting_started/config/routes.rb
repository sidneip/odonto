# -*- encoding : utf-8 -*-
Blog::Application.routes.draw do
  resources :posts do
    resources :comments
  end

  root "welcome#index"
end
