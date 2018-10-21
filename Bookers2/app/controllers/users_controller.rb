class UsersController < ApplicationController


	before_action :authenticate_user!

	def show
		@user = User.find (params[:id])
		@book = Book.new
		@books = @user.books
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to new_book_path, notice: "User info was successfully updated."
		else
			render :edit
		end
	end

	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
