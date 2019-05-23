Rails.application.routes.draw do
  root 'my/user_plans#free'

  devise_for :users

  namespace :my do
    resource :user_plan, only: %i[edit update show] do
      get :free
      get :start
    end
  end
end
