ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home"
  
  map.resources :sessions, :path_names => {:new => "login"}
  map.resources :usuarios, :path_names => {:new => "novo", :show => "detalhes", :edit => "editar"}
  map.resources :chamados, :path_names => {:new => "novo", :show => "detalhes", :edit => "editar"} 
  
  map.resources :responsabilidades
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
