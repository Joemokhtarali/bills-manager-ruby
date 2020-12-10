class User < ApplicationRecord
    has_many :incomes 
    has_many :bills
end
