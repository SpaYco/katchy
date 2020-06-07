class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true
  validates_format_of :icon, :with => %r{\.(png|jpg|jpeg)\z}i, :message => ": false link, imgur.com is recommended"
  has_many :recipes
end
