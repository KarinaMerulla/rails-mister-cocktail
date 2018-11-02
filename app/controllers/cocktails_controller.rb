class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]
  def index
    @cocktails = Cocktail.all
  end

  def show
    # nao vai nada aqui porque, na verdade, ta rolando o before_action e esse
    # codigo ta no metodo set_cocktail
  end

  def new
    @cocktail = Cocktail.new
    # new porque ele nao manda nada pro servidor e nao entra nada no DB
  end

  def create
    # fazer o metodo private
    # e nao esquece de deixar o codigo DRY com o before_action
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else render :new
      # direciona para a pagina primeira de novo
    end
  end

  def read
  end

private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  # pra galera nao cagar
  def cocktail_params
    params.require(:cocktails).permit(:name)
  end
end
