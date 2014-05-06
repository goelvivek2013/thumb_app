ThumbApp::Application.routes.draw do
   devise_for :users               
   root to: "products#index"
   resources :products do
     member { post :vote }
   end
end
