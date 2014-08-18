class StartupMailer < ActionMailer::Base
  default from: "info@startuptrends.pl"

	def activation_email(startup)
		@startup = startup
		mail to: startup.email, subject: "StartupTrends - Zweryfikuj swój adres email."
	end

end
