class User < ActiveRecord::Base
  has_many :jokes, dependent: :destroy
  has_many :stars, dependent: :destroy
  has_many :starred_jokes, through: :stars, source: :joke, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def owns_joke?(joke)
    id == joke.user_id
  end

  def starred?(joke)
    starred_jokes.include? joke
  end

  def score
    scores = []
    jokes.find_each { |joke| scores << joke.score }
    jokes.count + stars.count + scores.inject(0, :+)
  end
end
