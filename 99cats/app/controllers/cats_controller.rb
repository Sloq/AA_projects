class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    render :show
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat.id)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :sex, :color, :birth_date, :description)
  end
end
