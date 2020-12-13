class BillSerializer < ActiveModel::Serializer
    belongs_to :user
    attributes :id, , :name, :amount, :date, :category, :user_id
end

