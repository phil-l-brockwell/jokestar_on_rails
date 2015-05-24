class Joke < ActiveRecord::Base

  after_initialize :defaults
  belongs_to :user
  has_many :stars, dependent: :destroy

  def defaults
    rating = 0
  end

  def average_rating
    return 0 unless stars.any?
    total = stars.inject(0){ |sum, star| sum += star.rating } 
    average = total / stars.length.to_f
    average.round(1)
  end

end
