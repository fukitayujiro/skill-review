class ContentsController < ApplicationController
  before_action :move_to_index, only: [:new]

  def index
    @contents = Content.all.order("created_at DESC")
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.create(content_params)
    if @content.valid?
      @content.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @content = Content.find(params[:id])
    @message = Message.new
    @messages = @content.messages.includes(:user)
    array = []
    sum = 0
    @messages.each do |message|
      sum += message.point
      array << message.point
    end
    @aves = sum / array.length
  end

  def destroy
    content = Content.find(params[:id])
    content.destroy
    redirect_to root_path
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    content = Content.find(params[:id])
    content.update(content_params)
    redirect_to content_path
  end

  private
  def content_params
    params.require(:content).permit(:title, :media_id, :genre_id, :introduction, :url, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
