module Ratable
  extend ActiveSupport::Concern

  def average_rating

    return 0 if ratings.count == 0

    ratings.map{ |r| r.score }.sum / ratings.count
    #TÄTÄ METODIA EI JOSTAIN SYYSTÄ LÖYTYNYT count = pluralize(ratings.count, 'rating')
  end
end