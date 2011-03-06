# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110304149999) do

  create_table "cardholders", :force => true do |t|
    t.string   "firstname",      :limit => 40
    t.string   "lastname",       :limit => 40
    t.string   "phonenumber",    :limit => 40
    t.string   "city",           :limit => 40
    t.string   "country",        :limit => 40
    t.string   "address",        :limit => 100
    t.string   "passportnumber", :limit => 40
    t.integer  "count",                         :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", :force => true do |t|
    t.integer  "cardholder_id"
    t.string   "cardnumber",     :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cardholders_id"
  end

end
