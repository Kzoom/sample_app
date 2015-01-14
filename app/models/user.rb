class User < ActiveRecord::Base
	attr_accessor :remember_token
	# standardize on lower-case email addresses, 
	#  in case database is case-sensitive
  
  # 14-09-24 ksw...self isn't needed on the right side
  #    and the '!' bang makes this even shorter
	#before_save { self.email = email.downcase}
	
	#before_save { self.email = email.downcase } # ksw...this works
	before_save { email.downcase! } # ksw...this does too. From Ex 6.5, #2

	validates :name, presence: true, length: {maximum: 50}
	
	# 14-09-24 ksw...the first regex allows consecutive dots, '..'
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,4}+\z/i
	validates :email, presence: true, 
	                  format: {with: VALID_EMAIL_REGEX}, 
	                  uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, length: { minimum: 6 }, allow_blank: true 

	# 14-10-01 ksw...returns the hash digest of the given string
	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end

	# 14-10-02 ksw...return a random token, for persistent cookie use
	def User.new_token
		SecureRandom.urlsafe_base64
	end
  
  # 14-10-02 ksw...remember a user for persistent sessions
	def remember
		self.remember_token = User.new_token
		# note: update_attribute() bypasses validations
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	# 14-10-02 ksw...return true is the given token matches the digest
	def authenticated?(remember_token)
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

  # forget a user, Listing 8.38
	def forget
		update_attribute(:remember_digest, nil)
	end
end
