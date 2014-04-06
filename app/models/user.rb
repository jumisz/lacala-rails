class User < ActiveRecord::Base

	before_save :encrypt_password
	after_save :clear_password
	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		end
	end
	def clear_password
		self.password = nil
	end

	def self.authenticate(username="", login_password="")
		user = User.find_by_username(username)

		if user && user.match_password(login_password)
			return user
		else
			return false
		end
	end

	def match_password(login_password="")
		encrypted_password == BCrypt::Engine.hash_secret(login_password, self.salt)
	end
end
