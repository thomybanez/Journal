class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :user_id, presence:true, numericality: { only_integer: true }
    has_many :tasks, dependent: :destroy
    belongs_to :user
end
