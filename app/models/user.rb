class User < ActiveRecord::Base
  include Ratable

  has_secure_password

  validates :username, :uniqueness => true
  validates :username, :length => { minimum: 3 ,
                                    maximum: 30}

  validates :password, :length => { minimum: 4 }
  validates :password, format: { with: /.*[A-Z].*[0-9].*|.*[0-9].*[A-Z].*/,
                                 message: "Must have at least one number and one capital letter" }

  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_many :beerclubs, through: :memberships

  def to_s
    return "#{self.username}"
  end

end
