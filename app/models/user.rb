class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :recipes, foreign_key: :author_id, dependent: :destroy
  has_many :groups
end
