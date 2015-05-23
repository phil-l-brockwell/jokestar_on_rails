class User < ActiveRecord::Base
  
  after_initialize :defaults
  has_many :jokes, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def defaults
    self.rating = 0
  end

  def owns_joke?(joke)
    jokes.include? joke
  end
end
