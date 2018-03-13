class Toy < ApplicationRecord
  validates :name, null: false, uniqueness: { scope: [:toyable] }
  belongs_to :toyable, polymorphic: true
end
