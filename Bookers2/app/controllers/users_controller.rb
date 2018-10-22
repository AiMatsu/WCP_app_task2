class UsersController < ApplicationController


	before_action :authenticate_user!
	before_action :correct_user,   only: [:edit, :update]


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

	def correct_user
      @user = User.find(params[:id])
      redirect_to new_book_path unless @user == current_user
    end

	private
	def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	end
end
