class User < ApplicationRecord
	
	has_secure_password
	validates :name, presence: true, length: { maximum: 20 },
            uniqueness: { case_sensitive: false }  
 	 validates :password, length: { minimum: 5 }
end
