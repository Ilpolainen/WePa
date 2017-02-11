class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beerclub

  def to_s
    "#{user} joined #{beerclub} at #{self.created_at}"
  end
end
