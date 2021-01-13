class Account < ActiveRecord::Base
    belongs_to :user
    has_many :transactions
    validates :name, :type, presence: true
end  