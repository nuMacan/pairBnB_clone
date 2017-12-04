class HomeController < ApplicationController
  def homepage
  	@listings = Listing.all.order(:listing_name).page params[:page]

  end
end
