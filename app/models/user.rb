class User < ActiveRecord::Base
  
  after_initialize :defaults
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def defaults
    self.rating = 0
  end
end
