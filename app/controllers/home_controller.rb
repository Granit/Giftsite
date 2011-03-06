class HomeController < ApplicationController

	def reports
		@cardholders_size = Cardholder.count
		@cards_size = Card.count
		@unassign_cardholders_size = Cardholder.unassigned_count
		@assign_cardholders_size = @cardholders_size - @unassign_cardholders_size
		@unassign_cards_size = Card.unassigned_count
	end
	
end
