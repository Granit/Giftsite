class CreateAllTables < ActiveRecord::Migration
  def self.up
    create_table :cardholders, :force => true do |t|
      t.string   :firstname,                     :limit => 40
	  t.string   :lastname,                      :limit => 40
	  t.string   :phonenumber,                   :limit => 40
	  t.string   :city,                          :limit => 40
	  t.string   :country,                       :limit => 40
	  t.string   :address,                       :limit => 100
	  t.string   :passportnumber,                :limit => 40, :unique => true
	  t.integer  :count,                        :default => 0 
      t.timestamps
    end
    
    create_table :cards, :force => true do |t|
	  t.integer :cardholder_id
      t.string :cardnumber,                :limit => 10, :unique => true

      t.timestamps
      t.references :cardholders
    end
  end

  def self.down
    drop_table :cardholders
    drop_table :cards
  end
end
