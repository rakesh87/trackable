Rails.application.routes.draw do

	namespace :api do
		namespace :v1 do

      root 'sessions#index'

  		resources :sessions, only: [:create]
  		
  		resources :users, only: [:create] do
  			resources :short_uris, only: [:create, :destroy, :index, :show]
  		end

      resources :short_uris, only: [] do
  		  resources :short_visits, only: [:index, :show]
      end
  		
      get '/way-original' => 'redirector#redirect_to_original'

    end
  end


end
