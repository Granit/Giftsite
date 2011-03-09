class Cardholder < ActiveRecord::Base

	def self.phonenumber_regex
		/\A[A-Za-z0-9+]+\z/
	end
	def self.bad_phonenumber_message
		"only letters, numbers and '+' are allowed.".freeze
	end
validates :firstname,      :presence   => true,
                           :length     => { :within => 1..40 }
validates :lastname,       :presence   => true,
                           :length     => { :within => 1..40 }
validates :phonenumber,    :presence   => true,
                           :length     => { :within => 1..40 },   
                           :format     => { :with => Cardholder.phonenumber_regex, :message => Cardholder.bad_phonenumber_message }                                          
validates :city,           :presence   => true,
                           :length     => { :within => 1..40 }      
validates :country,        :presence   => true,
                           :length     => { :within => 1..40 } 
validates :address,        :presence   => true,
                           :length     => { :within => 1..100 } 
validates :passportnumber, :presence   => true,
						   :uniqueness => true,
                           :length     => { :within => 9..40 }                        

  
  has_many :cards 
  
 before_destroy :give_freedom_to_cards

	def self.phonenumber_regex
		/\A[A-Za-z0-9+]+\z/
	end
	def self.find_by_unassigned
		where("count = ?", 0)
	end
	def self.unassigned_count
		count(:all, :conditions => "count = 0")
	end
	
	def self.search(search)
	  if search
		find(:all, :conditions => ["lower(firstname) LIKE ? OR lower(lastname) LIKE ?", "%#{search.downcase}%", "%#{search.downcase}%"])
	  else
		find(:all)
	  end
	end
	
  protected

  def give_freedom_to_cards
    self.cards=[]
  end
end
