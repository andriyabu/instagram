class PicsController < ApplicationController
  before_action :find_pic, only: [:edit,:show, :update, :destroy, :upvote]
  before_action :authenticate_user!, except: [:index, :show]
  add_flash_types :info, :error, :warning, :success
  def index
    @pics = Pic.all.order(created_at: :desc)
  end

  def mypic
    @pics = Pic.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @pic = current_user.pics.build
  end

  def create
    @pic = current_user.pics.build(pic_params)
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
      if @pic.update(pic_params)
        flash[:success] = "Object was successfully updated"
        redirect_to @pic
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end


  def destroy
    if @pic.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to @pic
    end
  end

  def upvote
    @pic.liked_by current_user
    redirect_to @pic
  end


  private
    def pic_params
      params.require(:pic).permit(:title, :description,:avatar)
    end

    def find_pic
      @pic = Pic.find(params[:id])
    end

end
