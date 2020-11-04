class ContentsController < ApplicationController
  before_action :move_to_index, only: [:new]
  before_action :find_all, only: [:index, :genre_search, :media_search]
  before_action :find_params_id, only: [:show, :edit]

  def index
  end

  def concept
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @messages = @content.messages.includes(:user)
    array = []
    sum = 0
    @messages.each do |message|
      sum += message.point
      array << message.point
    end
    @aves = sum / array.length
    rescue ZeroDivisionError
      0
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
    redirect_to content_path
  end

  def genre_search
  end

  def media_search
  end

  private
  def content_params
    params.require(:content).permit(:id, :image, :title, :media_id, :genre_id, :introduction, :url ).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def find_all
    @contents = Content.page(params[:page]).order("created_at DESC")
  end

  def find_params_id
    @content = Content.find(params[:id])
  end
  
end
