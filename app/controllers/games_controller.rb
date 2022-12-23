require "open-uri"

class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @word_letters = @word.split("")
    @valide = valide_word?(@word)
  end
end


private

def valide_word?(word)
  url = "https://wagon-dictionary.herokuapp.com/#{word}"
  response = URI.open(url).read
  parsing = JSON.parse(response)
  parsing['found']
end
