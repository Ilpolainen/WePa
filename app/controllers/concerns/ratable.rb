module Ratable
  extend ActiveSupport::Concern

  def average_rating
    if ratings.count == 0
      return "Has 0 ratings"
    end

    if ratings.count == 1
      return "Has 1 rating, average #{1.0 * ratings.first.score}"
    end

    av = 0
    ratings.each do |rating|
      av = av + rating.score
    end
    av = (1.0 * av)/ratings.count
    #TÄTÄ METODIA EI JOSTAIN SYYSTÄ LÖYTYNYT count = pluralize(ratings.count, 'rating')

    "Has #{ratings.count} ratings, average #{av}"
  end
end