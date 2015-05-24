class Joke < ActiveRecord::Base

  belongs_to :user
  has_many :stars, dependent: :destroy

  def average_rating
    return 0 unless stars.any? 
    average = score / stars.length.to_f
    average.round(1)
  end

  def score
    stars.sum(:rating)
  end

end
