class JokesController < ApplicationController

  before_action :authenticate_user!, except: :index

  def index
    @jokes = Joke.all
    @joke = Joke.new
  end

  def create
    Joke.create(joke_params)
    redirect_to '/jokes'
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
