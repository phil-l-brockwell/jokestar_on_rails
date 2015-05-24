class User < ActiveRecord::Base
  
  after_initialize :defaults
  has_many :jokes, dependent: :destroy
  has_many :stars, dependent: :destroy
  has_many :starred_jokes, through: :stars, source: :joke, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def defaults
    rating = 0
  end

  def owns_joke?(joke)
    id == joke.user_id
  end

  def has_starred?(joke)
    starred_jokes.include? joke
  end
end
