class Product < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true

    default_scope {order(name: :asc)}
end
