class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :group_entity, dependent: :delete_all
  has_many :groups, -> { order(created_at: :desc) }, through: :group_entity, source: :group

  validates :name, presence: true
  validates :amount, presence: true
  validates :groups, length: { minimum: 1 }

  after_save :update_groups_total_amount

  after_destroy :update_groups_total_amount

  paginates_per 10

  private

  def update_groups_total_amount
    groups.each do |group|
      group.total_amount = group.entities.sum(:amount)
      group.save
    end
  end
end
