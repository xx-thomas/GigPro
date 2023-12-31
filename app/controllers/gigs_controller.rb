class GigsController < ApplicationController
	before_action :logged_in_user, only:[:new, :edit, :destroy, :complete, :accept]
	before_action :correct_user, only:[:edit, :destroy, :complete]
  def index
		Gig.all.each do |g|
			if !g.deadline.nil? && g.deadline.past? && g.worker_id.nil?
				Notification.all.each do |n|
					if n.gig_id == g.id
						n.destroy
					end
				end
				g.destroy
			end
		end
		@gigs = Gig.all
		if params[:search]
			search_query = "%#{params[:search]}%"
					@gigs = Gig.where('description LIKE :query OR title LIKE :query OR location LIKE :query', query: search_query)
		end
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

		if @gig.payment.nil? || @gig.title.nil? || @gig.location.nil?
			flash.now[:danger] = "Please make sure Title, Location and Payment are provided!"
			render :new, status: :unprocessable_entity
		else
			#@gig = Gig.new(gig_params)
			@gig.customer_id = current_user.id
			
			if current_user.balance < @gig.payment || @gig.payment <= 0 || (!@gig.deadline.nil? && @gig.deadline.past?) || !@gig.save
				if @gig.payment <= 0
					flash.now[:danger] = "Payment needs to be positive"
				end
				if current_user.balance < @gig.payment
					flash.now[:danger] = "You don't have enough balance!"
				end
				if !@gig.deadline.nil? && @gig.deadline.past?
					flash.now[:danger] = "Deadline is in the past! Please remove or update to the future"
				end
				render :new, status: :unprocessable_entity
			else
				User.all.each do |user|
					if user.id != current_user.id
						create_notifcation = Notification.new(user_id: user.id, gig_id: @gig.id, notification_type:"CREATE")
						create_notifcation.save
					end
				end
				redirect_to @gig
			end
		end
  end

  def destroy
    @gig = Gig.find(params[:id])
		Notification.all.each do |notif|
			if notif.gig_id == @gig.id
				notif.destroy
			end
		end
		@gig.destroy
    redirect_to action: "index", status: :see_other
  end

	def edit
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])

		new_deadline = gig_params[:deadline]
		new_payment = gig_params[:payment]

		valid = true
		invalid_date = false
		if !new_deadline.empty?
			datetime_object = DateTime.parse(new_deadline)
			if datetime_object.past?
				valid = false
				invalid_date = true
			end
		end

		invalid_payment_balance = false
		invalid_payment_negative = false
		if !new_payment.nil?
			new_payment_value = new_payment.to_i
			if new_payment_value <= 0
				invalid_payment_negative = true
				valid = false
			end
			if current_user.balance < new_payment_value
				invalid_payment_balance = true
				valid = false
			end
		end

		

    if valid && @gig.update(gig_params)
      redirect_to @gig
    else
			if invalid_date
				flash.now[:danger] = "Deadline is in the past! Please remove or update to the future"
			end
			if invalid_payment_balance
				flash.now[:danger] = "You don't have enough balance!"
			end
			if invalid_payment_negative
				flash.now[:danger] = "Payment needs to be positive"
			end
      render :edit, status: :unprocessable_entity
    end
  end

	def accept
		@gig = Gig.find(params[:id])
		Gig.update(@gig.id, :worker_id => current_user.id)
		Notification.all.each do |notif|
			if notif.gig_id == @gig.id
				notif.destroy
			end
		end
		accept_notification = Notification.new(user_id: @gig.customer_id, gig_id: @gig.id, notification_type:"ACCEPT")
		accept_notification.save
		redirect_to @gig
	end

	def complete
		@gig = Gig.find(params[:id])
		gig_worker = User.find(@gig.worker_id)
		gig_customer = User.find(@gig.customer_id)
		User.update(@gig.worker_id, :balance => gig_worker.balance + @gig.payment, :worker_rating => gig_worker.worker_rating + 1)
		User.update(@gig.customer_id, :balance => gig_customer.balance - @gig.payment)
		Notification.all.each do |notif|
			if notif.gig_id == @gig.id
				notif.destroy
			end
		end
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
		@gig = Gig.find(params[:id])
		@user = User.find(@gig.customer_id)
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
