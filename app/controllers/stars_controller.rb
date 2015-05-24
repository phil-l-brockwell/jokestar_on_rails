class StarsController < ApplicationController

  before_action :authenticate_user!

  def create
    joke = Joke.find(params[:joke_id])
    new_star = joke.stars.where(user: current_user).first_or_create(star_params)
    new_star.user = current_user
    flash[:notice] = 'Starred!' if new_star.save
    redirect_to '/'
  end

  private

  def star_params
    params.require(:star).permit(:rating)
  end
end
