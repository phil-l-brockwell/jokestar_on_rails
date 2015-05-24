class Star < ActiveRecord::Base

  belongs_to :joke
  belongs_to :user
  validates :rating, inclusion: 1..5

end
