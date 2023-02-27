class FavoritesController < ApplicationController

  #def create
    #いいねされた本(一冊)
    #いいね = ログイン中のユーザのいいね(post_image_id: いいねされた本)
    #いいねを保存
    #redirect_to post_image_path(post_image)
  #end

  def create
   book = Book.find(params[:book_id])
   favorite = current_user.favorites.new(book_id:book_id)
   favorite.save
   redirect_to books_path(book)
  end
  
# 例
#def destroy
    #いいねされた本(一冊)
    #いいね = ログイン中のユーザのいいね(post_image_id: いいねされた本)
    #いいねを消す
    #redirect_to post_image_path(post_image)
  #end

  def destroy
   book = Book.find(params[:book_id])
   favorite = current_user.favorites.find_by(book_id:book_id)
   favorite.destroy
  redirect_to books_path(book)
  end
  
end