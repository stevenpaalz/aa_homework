class Toy < ApplicationRecord
  validates :name, uniqueness: {scope: [:toyable_id, :toyable_type]}
  belongs_to :toyable, polymorphic: true
end
