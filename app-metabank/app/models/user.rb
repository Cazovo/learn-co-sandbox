  
class User < ActiveRecord::Base
    has_many :accounts
    has_many :transactions, through: :accounts
    validates :email, :password, presence: true
    validates :email, uniqueness: true
end