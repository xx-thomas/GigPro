class RatingsController < ApplicationController
  def new
    @review = Rating.new
  end

  def index
    render 'index'
  end


  def create
    @recipient_user = User.find(params[:recipient_id])
    #@review = Rating.new(ratings_params)
    @review = current_user.received_ratings.build(review_params)

    if @review.save
      flash[:success] = "Review complete!."
    else
      flash[:danger] = "Error creating review."
    end
  end


  private
  def ratings_params
    #differentiate worker and customer somehow? for recipient.
    params.require(:ratings).permit(:content, :recipient_id)
  end

end
