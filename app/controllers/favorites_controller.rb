class FavoritesController < ApplicationController
    
    def create
      book = Book.find(params[:book_id])
      comment = current_user.favorites.new(favorite_params)
      comment.book_id = book.id
      comment.save
      redirect_to book_path(book)
    end
    
    private
    
    def favorite_params
        params.require(:favorite).permit(:comment)
    end
    
    def destroy
        Favorite.find(params[:id]).destroy
        redirect_to book_path(params[:book_id])
    end
end
