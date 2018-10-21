class BooksController < ApplicationController

    before_action :authenticate_user!
	def new
		@book = Book.new
		@user = current_user
		@books = @user.books
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		@user = current_user  #indexの変数
		@books = Book.all     #indexの変数
		if @book.save
			redirect_to book_path(@book.id), notice: "Book was successfully created."
		else
			render :index
		end
	end

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
	end

	def show
		@book = Book.new
		@book_id = Book.find(params[:id])
	    @user = @book_id.user
	end

	def edit
		@book= Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book_id = Book.find(params[:id])     #showの変数
	    @user = @book_id.user                 #showの変数
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: "Book was successfully updated."
		else
			render :show
		end
	end

	def destroy
		book = Book.find(params[:id])
		if book.destroy
			redirect_to books_path, notice: "Book was successfully destroyed."
	    end
	end

	private
	def book_params
		params.require(:book).permit(:title,:opinion)
	end
end
