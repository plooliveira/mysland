class Island < ApplicationRecord
  belongs_to :user
  has_many :users, through: :reservations


  include PgSearch::Model
  pg_search_scope :search_do_allan,
    against: [ :name, :location, :description ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
