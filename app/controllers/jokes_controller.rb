class JokesController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
    @user = current_user || User.new
    @jokes = Joke.all
    @joke = Joke.new
    @users = User.all
    @star = Star.new
  end

  def create
    current_user.jokes.create(joke_params)
    flash[:notice] = 'Added new Joke!'
    redirect_to '/'
  end

  def destroy
    joke = Joke.find(params[:id])
    joke.destroy
    flash[:notice] = 'Joke deleted successfully'
    redirect_to '/'
  end

  private

  def joke_params
    params.require(:joke).permit(:text)
  end
end
