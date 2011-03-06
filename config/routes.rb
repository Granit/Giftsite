Giftsite::Application.routes.draw do  |map|


	map.resources :cardholders
	map.resources :cards
	map.destroy_cardholder "cardholders/destroy/:id", :controller => "cardholders", :action=>"destroy"
	map.destroy_card "cards/destroy/:id", :controller => "cards", :action=>"destroy"
	map.reports "/reports", :controller => "home", :action=>"reports"
	map.root :controller => "home"
	map.connect ':controller/:action/:id'
	map.connect ':controller/:action/:id.:format'
end
