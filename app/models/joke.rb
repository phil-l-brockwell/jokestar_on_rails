class Joke < ActiveRecord::Base

  after_initialize :defaults
  belongs_to :user

  def defaults
    self.rating = 0
  end

end
