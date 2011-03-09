class Card < ActiveRecord::Base

	def self.cardnumber_regex
		/\A[\d]+\z/
	end
	def self.bad_cardnumber_message
		"only numbers are allowed.".freeze
	end
	
validates :cardnumber, :presence   => true,
					   :uniqueness => true,
                       :length     => { :within => 10..10 },
                       :format     => { :with => Card.cardnumber_regex, :message => Card.bad_cardnumber_message }
belongs_to :cardholder

	
	def self.find_by_unassigned
		find(:all, :conditions => "cardholder_id is NULL")
	end
	def self.unassigned_count
		count(:all, :conditions => "cardholder_id is NULL")
	end
	
	def self.search(search)
	  if search
		find(:all, :conditions => ["cardnumber LIKE ? ", "%#{search}%"])
	  else
		find(:all)
	  end
	end
	
	
end
