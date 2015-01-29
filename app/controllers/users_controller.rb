class UsersController < ApplicationController
	def show
  	@user = User.find(params[:id])
  end

  def new
  	@registration = User.new
  end

  def create
  	@registration = User.new(registration_params)
  	if @registration.save
      flash[:success] = "Record Inserted"
  	   redirect_to @registration 
    else
    	render 'new'
    end
  end

  private
      def registration_params
         params.require(:user).permit(:name, :email, :dob, :password, :gender, :lastname)
      end
     # Confirms a logged-in user.
      def logged_in_user
         unless logged_in?
          flash[:danger] = "Please log in."
          redirect_to login_url
         end
       end
end
