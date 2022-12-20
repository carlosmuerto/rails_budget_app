class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :group_entity
  has_many :entities, through: :group_entity, source: :entity

  validates :name, presence: true
  validates :icon, presence: true
end
