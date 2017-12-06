class ListingsController < ApplicationController
  # before_action :set_listing, except: [:index_listing, :new, :create]
  before_action :require_login, except: [:show]


  def index
    @listings = Listing.all.order(:city).page(params[:page]).per(10)
  end

  def new
    @listing = current_user.listings.build
      # authorization code
      if current_user.superadmin?
        flash[:notice] = "Sorry. You are not allowed to perform this action."
        return redirect_to root_path, notice: "Sorry. You do not have the permission to verify a property."
      end
      # end authorization code

      # other code to make the new action work!
  end

#use to update room data before run def new
  def create
    @listing = current_user.listings.build(listing_params)
    if @listing.save
      # redirect_to "/users/#{current_user.id}/listing", notice: "Saved Succes"
      # byebug
      redirect_to user_listing_path(current_user.id, @listing.id), notice: "Saved Success"
    else 
      flash[:alert] = @listing.error.full_messages
      render :new
    end 
  end

  def show
    @listing =  Listing.find(params[:id])
    # @photos = @listing.photos
  end 


  #first i ahve to show a verify button whe n i view a specific listing. Show this button
  #only if i am superamind or moderator (upt oyou).
  # u need to create a custom route to go to this verify method below
  # be abel to view a specific listing page
  # inside that, you ahve tubtton to verify listing if you are a superadmin/moderator
  #once u click go the method below and update listing
  def verify
    if current_user.superadmin?
      @listing = Listing.find(params[:id])
      @listing.update(verification: true)
      flash[:notice] = "Verified!!"
      redirect_to listing_path(@listing)
      end
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
    @listing = Listing.find(params[:id])
  end 

  def listing_params
    params.require(:listing).permit(:listing_name, :listing_type, :number_of_rooms, :city, :price, :wifi, :active, :user_id, :role)
  end 

end
