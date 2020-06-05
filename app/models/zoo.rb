class Zoo < ApplicationRecord
  has_many :animals
  has_one_attached :image
end
