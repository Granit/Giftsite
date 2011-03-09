Giftsite::Application.routes.draw do 

=begin
	map.resources :cardholders
	map.resources :cards
	map.destroy_cardholder "cardholders/destroy/:id", :controller => "cardholders", :action=>"destroy"
	map.destroy_card "cards/destroy/:id", :controller => "cards", :action=>"destroy"
	map.reports "/reports", :controller => "home", :action=>"reports"
	map.root :controller => "home"
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/:id.:format'
=end
	resources :cardholders
	resources :cards
	match "/reports", :to => "home#reports", :as=>"reports"
	
	match "/cardholders/destroy/:id", :to => "cardholders#destroy", :as =>"destroy_cardholder"
	match "/cards/destroy/:id", :to => "cards#destroy", :as =>"destroy_card"
	root :to => 'home#index'
end
