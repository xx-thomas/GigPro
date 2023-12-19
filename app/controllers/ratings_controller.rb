class RatingsController < ApplicationController
  def new
    @rating = Rating.new
    @user_id = params[:user_id] if params[:user_id]
  end

  def index
    render 'index'
  end


  def create
    #@rating = Rating.received_ratings.build(rating_params)
    @rating = Rating.new(rating_params)

    if @rating.content.nil?
      flash.now[:danger] = "Review cannot be empty"
      end
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
