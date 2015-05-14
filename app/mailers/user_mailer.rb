class UserMailer < ApplicationMailer
	default from: 'noreply@coledger.io'

	def welcome_email(user)
		@user = user
		@url = 'https://coledgerapp.herokuapp.com'
		mail(to: @user.email, subject: 'Welcome to Coledger!')
	end

	def password_reset(user)
		@user = user
		@url = 'localhost:3000/password_resets/'+@user.reset_token + '/edit?email='+@user.email
		mail(to: @user.email, subject: 'CoLedger: reset password')
	end
end
