require 'api_version_constraint'



Rails.application.routes.draw do

  devise_for :users, controllers: {sessions:"api/v1/sessions"}
    
		namespace :api, defaults:  {format: :json} do 
			
			namespace :v1, path:"/", constraints: ApiVersionConstraint.new(version:1) do
				
				resources :users
                resources :sessions
                resources :ganhos
                resources :despesas


			end

            namespace :v2, path:"/", constraints: ApiVersionConstraint.new(version:2, default: true) do
				
				resources :users
                resources :sessions
                resources :ganhos
                resources :despesas


			end
            
		end

	end
