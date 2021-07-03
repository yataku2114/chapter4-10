class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def create
    @user = User.new(book_params)
    if @user.save
       flash[:notice] = "Welcome!You have signed up successfully"
       redirect_to user_path(@user.id)
    else
       @books = Book.all
       render :index
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
       render "edit"
    else
       redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] ="You have update user successfully"
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

