require 'rest-client'

class WinesController < ApplicationController

  def index
    @wines = Wine.all.order("id DESC").page(params[:page])
  end

  def api_retrieval
    fetched = APIFetch.new(params[:search])
    if fetched.errors.length != 0
      flash[:errors] = fetched.errors.join
      redirect_to wines_api_form_url
    elsif fetched.wines.length == 0
      flash[:errors] = "That query did not return any wines"
      redirect_to wines_api_form_url
    else
      @wines = fetched.wines
    end
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)

    if @wine.save
      redirect_to wines_url
    else
      flash.now[:errors] = @wine.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])

    if @wine.update(wine_params)
        redirect_to wines_url
    else
      flash.now[:errors] = @wine.errors.full_messages.to_sentence
      render :edit
    end
  end

  def show
    redirect_to wines_url
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
end
