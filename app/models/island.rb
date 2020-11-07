class Island < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?



  include PgSearch::Model
  pg_search_scope :island_pg_search,
    against: [ :name, :location, :description ],
    # ignoring: :accents,
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something
    }


  has_one_attached :image


end
