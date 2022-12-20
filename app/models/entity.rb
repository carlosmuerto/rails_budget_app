class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :group_entity
  has_many :groups, through: :group_entity, source: :group

  validates :name, presence: true
  validates :amount, presence: true
  validates :groups, length: { minimum: 1 }

  # TODO: validate has at lest une group
end
