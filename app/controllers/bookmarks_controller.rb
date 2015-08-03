class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find_by(id: params[:id])
    @user = User.find_by(id: @bookmark.user_id)
  end

  def new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.url = params[:url]
    @bookmark.name = params[:name]
    @bookmark.description = params[:description]
    @bookmark.user_id = params[:user_id]

    if @bookmark.save
      redirect_to "/bookmarks/#{ @bookmark.id }"
    else
      render 'new'
    end
  end

  def edit
    @bookmark = Bookmark.find_by(id: params[:id])
    @user = User.find_by(id: @gif.user_id)
  end

  def update
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.url = params[:url]
    @bookmark.name = params[:name]
    @bookmark.description = params[:description]
    @bookmark.user_id = params[:user_id]

    if @bookmark.save
      redirect_to "/bookmarks/#{ @bookmark.id }"
    else
      render 'edit'
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @bookmark.destroy


    redirect_to "/bookmarks"
  end
end
