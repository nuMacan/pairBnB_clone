
class UsersController < Clearance::UsersController

	# before_action [:show,:edit], show_Users
	# before_action :set_users, only [:show, :edit]

	def create
		user = User.new(user_params)
		if user.save
			redirect_to root_path
		else 
			redirect_to sign_up_path
		end 
	end 

	def show
  		@listings = @user.listings
  	end


  def edit
    @user = current_user
    redirect_to root_path
  end


	

	private 

	def set_users
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end 

	#below here is old method from rails 3 to add column name into clearance user management
	# def user_from_params
	#     email = user_params.delete(:email)
	#     password = user_params.delete(:password)
	#     name = user_params.delete(:name)

	#     Clearance.configuration.user_model.new(user_params).tap do |user|
	#       user.email = email
	#       user.password = password
	#       user.name = name 
	#       end 
	# 	end



end