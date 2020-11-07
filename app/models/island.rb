class Island < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy
end