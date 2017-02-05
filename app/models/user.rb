class User < ActiveRecord::Base
  include Ratable

  validates :username, :uniqueness => true
  validates :username, :length => { minimum: 3 ,
                                    maximum: 30}

  has_many :ratings
  has_many :beers, through: :ratings
  has_many :memberships

end
