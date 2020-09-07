class ContentsController < ApplicationController

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

  private
  def content_params
    params.require(:content).permit(:title, :media_id, :genre_id, :introduction, :url, :image)
  end

end
