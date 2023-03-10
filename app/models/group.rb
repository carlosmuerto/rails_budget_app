class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :group_entity
  has_many :entities, -> { order(created_at: :desc) }, through: :group_entity, source: :entity

  validates :name, presence: true
  validates :icon, presence: true
  validates :total_amount, numericality: {
    greater_than_or_equal_to: 0
  }

  paginates_per 10

  ICONS = [
    'โ๏ธ', 'โ', '๐งน', 'โ', 'โก',
    '๐ฒ', '๐', '๐', '๐', '๐',
    '๐๏ธ', '๐ถ', '๐', '๐พ', 'โ๐ฝ',
    '๐๐ฝ', 'โค๏ธ', 'โญ', '๐ถ', '๐ณ',
    '๐', '๐', '๐ง', 'โ๏ธ', '๐น',
    '๐', '๐ฅ', 'โ๏ธ', '๐๏ธ', '๐ฒ',
    '๐จ', '๐', '๐', '๐', '๐'
  ].freeze
end
