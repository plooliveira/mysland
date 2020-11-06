class Island < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations
  has_one_attached :image
end
