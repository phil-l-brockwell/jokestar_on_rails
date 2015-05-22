class Joke < ActiveRecord::Base

  after_initialize :defaults

  def defaults
    self.rating = 0
  end

end
