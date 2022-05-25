class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを登録しました"
    end
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルを編集しました"
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  def destroy
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre.destroy
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
