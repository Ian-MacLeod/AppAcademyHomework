class House < ApplicationRecord
  validates :address, presence: true
  has_many(
    :people,
    foreign_key: :house_id,
    primary_key: :id
  )
end
