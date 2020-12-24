class User < ApplicationRecord
    has_many :incomes 
    has_many :bills
    has_secure_password
end
