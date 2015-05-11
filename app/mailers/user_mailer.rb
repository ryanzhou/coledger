class UserMailer < ApplicationMailer
	default from: 'noreply@coledger.io'

	def welcome_email(user)
		@user = user
		@url = 'https://coledgerapp.herokuapp.com'
		mail(to: @user.email, subject: 'Welcome to Coledger!')
	end
end
