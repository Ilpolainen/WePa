class Brewery < ActiveRecord::Base
  include Ratable

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                   :only_integer => true}
  validate :not_in_future


  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers, dependent: :destroy

  def restart
    self.year = Date.today.year
    puts "changed year to #{year}"
  end

  def to_s
    return "#{self.name}"
  end

  def not_in_future
    if self.year > Date.today.year
      errors.add(:year, 'is in the future.')
    end
  end

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

end
