class Notifier < ApplicationMailer
	# Comment. default_url_options mailer method specifies the default url mail messages will use.
	default_url_options[:host] = "localhost:3000"
	default from: 'from@example.com'

	def password_reset(user)
		@user = user
		mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
			 subject: "Reset Your Password")
	end
end