class StarsController < ApplicationController

  def create
    joke = Joke.find(params[:joke_id])
    new_star = joke.stars.create(star_params)
    new_star.user = current_user
    flash[:notice] = 'Starred!' if new_star.save
    redirect_to '/'
  end

  private

  def star_params
    params.require(:star).permit(:rating)
  end

end
