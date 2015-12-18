class WinesController < ApplicationController

  def index
    @wines = Wine.all
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
  end

  def edit
    @wine = Wine.find(params_id)
  end

  def update
    @wine = Wine.find(params_id)

    if @wine.update(wine_params)
        redirect_to edit_wine_url(@wine)
    else
      render :edit
    end
  end

  private

  def wine_params
    params.require(:wine).permit(:name,
                                 :url,
                                 :min_price,
                                 :max_price,
                                 :retail_price,
                                 :kind)
end
