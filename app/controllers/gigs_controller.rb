class GigsController < ApplicationController
	before_action :logged_in_user, only:[:new, :edit, :destroy, :complete]
	before_action :correct_user, only:[:edit, :destroy, :complete]
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
		@customer = User.find(@gig.customer_id)
		if !@gig.worker_id.nil?
			@worker = User.find(@gig.worker_id)
		end
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.new(gig_params)
		@gig.customer_id = current_user.id
		
		
		if current_user.balance < @gig.payment || @gig.payment <= 0 || !@gig.save
			if @gig.payment <= 0
				flash.now[:danger] = "Payment needs to be positive"
			end
			if current_user.balance < @gig.payment
				flash.now[:danger] = "You don't have enough balance!"
			end
			render :new, status: :unprocessable_entity
		else
			redirect_to @gig
		end
  end

  def destroy
    @gig = Gig.find(params[:id])
    @gig.destroy
    redirect_to action: "index", status: :see_other
  end

	def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])

    if @gig.update(gig_params)
      redirect_to @gig
    else
      render :edit, status: :unprocessable_entity
    end
  end

	def accept
		@gig = Gig.find(params[:id])
		Gig.update(@gig.id, :worker_id => current_user.id)
	end

	def complete
		@gig = Gig.find(params[:id])
		gig_worker = User.find(@gig.worker_id)
		gig_customer = User.find(@gig.customer_id)
		User.update(@gig.worker_id, :balance => gig_worker.balance + @gig.payment, :worker_rating => gig_worker.worker_rating + 1)
		User.update(@gig.customer_id, :balance => gig_customer.balance - @gig.payment)
		@gig.destroy
		flash[:success] = "Gig: '#{@gig.title}' was completed!."
		redirect_to action: "index"
	end

	def logged_in_user
		unless logged_in?
			flash[:danger] = "Please log in."
			redirect_to login_url, status: :see_other
		end
	end

	def correct_user
		@user = User.find_by(params[:id])
		unless @user == current_user
			flash[:danger] = "This is not your gig!"
			redirect_to(root_url, status: :see_other)
		end
	end

  private
    def gig_params
      params.require(:gig).permit(:title, :description, :location, :payment, :deadline)
    end

end
