class WorkersController < ApplicationController
  def index
		@workers = Worker.all
  end

	def show
    @worker = Worker.find(params[:id])
  end

  def new
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def worker_params
      params.require(:worker).permit(:name, :location, :number, :language_preference)
    end
end
