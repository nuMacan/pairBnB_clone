class ListingsController < ApplicationController
  before_action :set_listing, except: [:index_listing, :new, :create]
  before_action :require_login, except: [:show]


  def index_listing
    @listings = current_user.listings
  end

  def new
    @listing = current_user.listings.build
  end

#use to update room data before run def new
  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      redirect_to property_listing_path(@listing), notice: "Saved Succes"
    else 
      flash[:alert] = @listing.error.full_messages
      render :new
    end 
  end

  def show
    @photos = @listing.photos
  end 

  def pricing
  end

  def description
  end

  def photo_upload
  end

  def amenities
  end

  def location
  end

  def update
    if @listing.update(listing_params)
      flash[:notice] = "Saved.."
    else 
      flash[:notice] = @listing.errors.full_messages
    end 
    redirect_back(fallback_location: request.referer)
  end

private
  def set_listing
    @listing = Listing.find(params[:id]);
  end 

  def listing_params
    params.required(:listing).permit(:listing_name, :listing_type, :room_number, :city, :price, :wifi, :active)
  end 
end