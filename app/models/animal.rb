class Animal < ApplicationRecord
  belongs_to :zoo
  has_one_attached :image
end
