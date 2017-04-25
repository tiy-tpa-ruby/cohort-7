Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :notes do
      collection do
        get '/tag/:tag_name' => "notes#for_tag"
      end
    end
  end
end
