class User < ActiveRecord::Base
	# standardize on lower-case email addresses, 
	#  in case database in case-sensitive
  
  # 2014-09-24 ksw...self isn't needed on the right side
  #    and the '!' bang makes this even shorter
	#before_save { self.email = email.downcase}
	
	before_save { email.downcase!}

	validates :name, presence: true, length: {maximum: 50}
	
	# 2014-09-24 ksw...the first regex allows consecutive dots, '..'
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]{2,4}+\z/i
	validates :email, presence: true, 
	                  format: {with: VALID_EMAIL_REGEX}, 
	                  uniqueness: {case_sensitive: false}

	has_secure_password
	validates :password, length: { minimum: 6 }
end
