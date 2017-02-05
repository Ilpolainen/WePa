class Membership < ActiveRecord::Base
  belongs_to :beerclub
  belongs_to :user

  validates :user_id, presence: true
  validates :beer_club_id, presence: true
end
