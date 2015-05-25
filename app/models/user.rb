class User < ActiveRecord::Base
  DEFAULT_RANK = :snowflake
  RANKS =
    {
      0 => :buffoon,
      5 => :performing_monkey,
      10 => :stooge,
      15 => :clown,
      20 => :jester,
      25 => :imp,
      30 => :funny_man,
      35 => :kidder,
      40 => :funster,
      45 => :josher,
      50 => :trickster,
      55 => :hoaxer,
      60 => :prankster,
      65 => :jokester,
      70 => :wise_cracker,
      75 => :entertainer,
      80 => :life_of_the_party,
      85 => :comic,
      90 => :joker,
      100 => :'joke_*'
    }

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

  def rank
    return DEFAULT_RANK if score <= 20
  end
end
