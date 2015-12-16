class BooksController < ApplicationController
def index
	@books=Book.all
end
def edit
	@book=Book.find(params[:id])
	render :layout => 'admin'
end
def update
	@book=Book.find(params[:id])
	if @book.update(book_params)
		flash[:success] = "Book updated..."
		redirect_to bookss_path
	else
		render "edit"
	end
end
def destroy
	@book.destroy
end
def show
	@book = Book.find(params[:id])	
end

def book_params
	params.require(:book).permit(:title, :author, :price, :abstract, :published_on, :genre_id)
end
def who_bought
@book = book.find(params[:id])
@latest_order = @book.orders.order(:updated_at).last
if stale?(@latest_order)
respond_to do |format|
format.atom
end
end
end
end

