class CustomersController < ApplicationController
  def index
		@customers = Customer.all
  end

	def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def customer_params
      params.require(:customer).permit(:name, :location, :number)
    end
end
