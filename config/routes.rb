Rails.application.routes.draw do
  resources :authors, only: %i[show index] do
    resources :posts, only: %i[show index new edit]
  end

  resources :posts, only: %i[index show new create edit update]

  #get '/admin/stats', to: 'stats#index' 

  #scope '/admin', module: 'admin' do  -->       #we write scope because we want to use /admin as url prefix and
                                              # also letting Rails know that all of the included routes will be handle by controllers in the admin module
    #resources :stats, only: [:index]
  #end 
  # is the same as | 
  #                v
  
  namespace :admin do               #namespace is a shorter way as i see it :]
    resources :stats, only: [:index]
  end 
  
  root 'posts#index'

end
