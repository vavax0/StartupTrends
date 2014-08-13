class StartupMailer < ActionMailer::Base
  default from: "vavax0@gmail.com"

	def activation_email(startup)
		@startup = startup
		mail to: startup.email, subject: "Email Aktywacyjny"
	end

end
