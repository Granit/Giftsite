
class Cardholder < ActiveRecord::Base

 # set_table_name 'users'

validates :firstname,      :presence   => true,
                           :length     => { :within => 1..40 }
validates :lastname,       :presence   => true,
                           :length     => { :within => 1..40 }
validates :phonenumber,    :presence   => true,
                           :length     => { :within => 1..40 }                                             
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

	def self.find_by_unassigned
		where("count = ?", 0)
	end
	def self.unassigned_count
		count(:all, :conditions => "count = 0")
	end
	
  protected

  def give_freedom_to_cards
    self.cards=[]
  end
end
