class Card < ActiveRecord::Base

validates :cardnumber, :presence   => true,
					   :uniqueness => true,
                       :length     => { :within => 10..10 }
belongs_to :cardholder
	
	def self.find_by_unassigned
		find(:all, :conditions => "cardholder_id is NULL")
	end
	def self.unassigned_count
		count(:all, :conditions => "cardholder_id is NULL")
	end
end
