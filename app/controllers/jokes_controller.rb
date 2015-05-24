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
    redirect_to '/'
  end

  def destroy
    joke = Joke.find(params[:id])
    joke.delete
    flash[:notice] = 'Joke deleted successfully'
    redirect_to '/jokes'
  end

  private

  def joke_params
    params.require(:joke).permit(:text)
  end
end
