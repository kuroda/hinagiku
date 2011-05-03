class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    redirect_to :categories, :status => 301
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to :categories
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.attributes = params[:category]
    if @category.save
      redirect_to :categories
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to :categories
  end
end
