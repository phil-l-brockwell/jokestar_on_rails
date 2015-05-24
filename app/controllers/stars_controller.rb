class StarsController < ApplicationController

  def new

  end

  def create
    joke = Joke.find(params[:joke_id])
    joke.stars.create(star_params)
    redirect_to '/'
  end

  def destroy

  end

  private

  def star_params
    params.require(:star).permit(:rating)
  end

end
