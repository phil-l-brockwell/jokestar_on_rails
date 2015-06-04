class StarsController < ApplicationController

  before_action :authenticate_user!

  def create
    joke = Joke.find(params[:joke_id])
    new_star = joke.stars.where(user: current_user).first_or_create(star_params)
    new_star.user = current_user
    if new_star.save
      flash[:notice] = 'Starred!'
      current_user.increment_rating!
      joke_user = User.find(joke.user_id)
      joke_user.increment_rating!(new_star.rating)
    end
    redirect_to '/'
  end

  private

  def star_params
    params.require(:star).permit(:rating)
  end
end
