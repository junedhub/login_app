class UsersController < ApplicationController
	before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:show, :edit, :update, :destroy]

	def show
  	@user = User.find(params[:id])
  end

  def new
  	@registration = User.new
     
  end

  def create
  	@registration = User.new(registration_params)
  	if @registration.save
  	 log_in @registration
      flash[:success] = "Record Inserted"
       flash.now[:success] = "Record Inserted"
  	   redirect_to @registration 
    else
    	render 'new'
    end
  end
      

       

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(registration_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def edit
    @user_update = User.find(params[:id])
  end

  def destroy 
     User.find(params[:id]).destroy
     redirect_to signup_path
  end

  private
      def registration_params
         params.require(:user).permit(:name, :email, :dob, :password, :gender, :lastname, :password_confimation)
      end
     # Confirms a logged-in user.
      def logged_in_user
         if not session[:user_id]
          flash[:danger] = "Please log in."
          redirect_to signup_path
         end
       end
      # Confirms the correct user.
      def correct_user
        @user = User.find(params[:id])
        redirect_to(signup_path) unless @user == current_user
      end
end
