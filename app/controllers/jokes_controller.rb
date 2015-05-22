class JokesController < ApplicationController

  def index
    @jokes = Joke.all
    @joke = Joke.new
  end

  def create
    Joke.create(joke_params)
    redirect_to '/jokes'
  end

  private

  def joke_params
    params.require(:joke).permit(:text)
  end

end
