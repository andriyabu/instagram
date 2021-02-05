class PicsController < ApplicationController
  before_action :find_pic, only: [:edit,:show, :update, :destroy]
  def index
    @pics = Pic.all.order(created_at: :desc)
  end

  def new
    @pic = Pic.new
  end

  def create
    @pic = Pic.new(pic_params)
    if @pic.save
      redirect_to @pic
    else
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
  

  private
    def pic_params
      params.require(:pic).permit(:title, :description)
    end

    def find_pic
      @pic = Pic.find(params[:id])
    end

end
