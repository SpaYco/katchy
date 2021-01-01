class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :video, presence: true, uniqueness: true
  validates :ingredients, presence: true
  validates :amount, presence: true, uniqueness: false
  validates :author_id, presence: true
  validates :group_id, presence: true
  # rubocop:disable Layout/LineLength
  validates_format_of :video, with: %r{\A(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+\z}i, message: 'should be a YouTube Video Link'
  # rubocop:enable Layout/LineLength
  belongs_to :author, class_name: 'User'
  belongs_to :group
end
