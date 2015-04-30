class UserMailer < ApplicationMailer
	default from: 'coledger.helper@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'localhost:3000'
		mail(to: @user.email, subject: 'Welcome to Coledger!')
	end
end
