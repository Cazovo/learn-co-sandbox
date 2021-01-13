class Transaction < ActiveRecord::Base
    belongs_to :account
    validates :type, :amount, :date, presence: true
end   