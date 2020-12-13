class UserSerializer < ActiveModel::Serializer
    has_many :bills
    has_many :incomes
    attributes :id, :user_name, :bills, :incomes
end