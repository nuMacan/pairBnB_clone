class User < ApplicationRecord
  include Clearance::User


#listing management, organize relation of user and listing 
  has_many :listings

  enum role: [:customer, :moderator, :superadmin]

#user management for sign in with omniauth(other site,eg facebook or google)
  has_many :authentications, dependent: :destroy
  def self.create_with_auth_and_hash(authentication, auth_hash)
  	user = self.create!(
  		name: auth_hash["name"],
  		email: auth_hash["extra"]["raw_info"]["email"],
  		password: SecureRandom.hex(5)
  		)
  	 user.authentications << authentication
  	return user 
  end

#grab fb_token to access facebook for user data 
  def fb_token 
  	x = self.authentications.find_by(provider:'facebook')
  	return x.token unless x.nill
  end 

end
