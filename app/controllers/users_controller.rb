class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user, only: [:edit, :update]


  def new
     @user = User.new
  end

  def edit
  end

  def index
     @users = User.paginate(page: params[:page], per_page: 15)
  end

  def show
     @user= User.find(params[:id])
     @pivot = current_user.pivots.build if signed_in?
     @pivots = @user.pivots.paginate(page: params[:page], per_page: 5)
  end

  def destroy
     User.find(params[:id]).destroy
     flash[:success] = "User deleted!"
     redirect_to users_path
  end

  def create
     @user = User.new(params[:user])
     if @user.save
	sign_in @user
        flash[:success] = "Welcome to Pivot IT!"
        redirect_to @user
     else
        render 'new'
     end
  end

  def update 

     if @user.update_attributes(params[:user])
	flash[:success] = "Profile changed"
	sign_in @user
	redirect_to @user
     else
	render 'edit'
     end     
  end


  private 
     

     def correct_user
         @user = User.find(params[:id])
         redirect_to(root_path) unless current_user?(@user)
     end

end
