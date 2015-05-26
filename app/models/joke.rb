class Joke < ActiveRecord::Base
  belongs_to :user
  has_many :stars, dependent: :destroy

  def average_rating
    return 0 unless stars.any?
    (score / stars.length.to_f).round(1)
  end

  def score
    stars.sum(:rating)
  end

  def self.random
    ids = connection.select_all("SELECT id FROM jokes")
    find(ids[rand(ids.length)]["id"].to_i) unless ids.blank?
  end
end
