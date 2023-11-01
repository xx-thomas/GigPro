class GigsController < ApplicationController
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new # Used for the form
  end

  def create
    @gig = Gig.new(title:"..", description:"...")
    if @gig.save
      redirect_to @gig
    else
      render :new, status: :unprocessable_entity # On failure goes back to New aka beginning with status unprocessable
    end
  end
end
