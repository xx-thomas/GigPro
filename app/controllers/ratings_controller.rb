class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    #@rating.recipient_id = params[:recipient_id] if params[:recipient_id]
  end

  def index
    render 'index'
  end


  def create
    #@rating = current_user.received_ratings.build(rating_params)
    @rating = Rating.new(rating_params)

    if @rating.save
      flash[:success] = "Success!"
      redirect_to 'index'
    else
      flash.now[:danger] = "Error creating review"
      render :new
    end

  end


  private
  def rating_params
    params.require(:rating).permit(:content, :rating_value)
  end

end
