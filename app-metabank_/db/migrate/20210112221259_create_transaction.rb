class CreateTransaction < ActiveRecord::Migration

    def change
        create_table :transactions do |t|
            t.integer   "account_id"
            t.string   "amount"
            t.string   "type" 
            t.datetime "date",      null: false
        end
    end
end