  
class CreateAccount < ActiveRecord::Migration
    
    def change
        create_table :accounts do |t|
	          t.integer  "user_id"
            t.string   "name"
            t.datetime "created"  , null: false
            t.string   "type"
        end
    end
end