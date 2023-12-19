class UsersController < ApplicationController
  def show
		@user = User.find(params[:id])
    @received_ratings = current_user.received_ratings
	end

	def new
		@user = User.new
  end
	
	def create
    @user = User.new(user_params)
		@user.balance = 1000
    if @user.save
			reset_session
			log_in @user
			flash[:success] = "Welcome to GigPro '#{@user.name}'"
      redirect_to @user
			#redirect_to controller: :gigs, action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end


	private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
