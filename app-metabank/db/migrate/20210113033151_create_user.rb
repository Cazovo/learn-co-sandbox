class CreateUser < ActiveRecord::Migration

    def change
        create_table :users do |t|
            t.string    "first_name"
            t.string    "last_name"
            t.string    "email"
            t.string    "password"
            t.string    "street_name"
            t.string    "city"
            t.string    "zip_code"
            t.string    "number"
            t.datetime  "birth_date"
            t.string    "gender"
            t.string    "salary"
            t.string    "occupation"
            t.datetime "updated_at",  null: false
        end
    end
end