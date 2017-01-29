class Brewery < ActiveRecord::Base
  include Ratable

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers, dependent: :destroy

  def restart
    self.year = 2017
    puts "changed year to #{year}"
  end

  def to_s
    return "#{self.name}"
  end

  def print_report
    puts name
    puts "established at year #{year}"
    puts "number of beers #{beers.count}"
  end

end
