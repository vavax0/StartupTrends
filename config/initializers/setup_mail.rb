ActionMailer::Base.smtp_settings = {
	:address				=> ENV["EMAIL_ADDRESS"]
	:port					=> ENV["EMAIL_PORT"]
	:domain					=> ENV["EMAIL_DOMAIN"]
	:user_name				=> ENV["EMAIL_USER_NAME"]
	:password				=> ENV["EMAIL_PASSWORD"]
	:authentication			=> ENV["EMAIL_AUTHENTICATION"]
	:enable_starttls_auto	=> ENV["EMAIL_ENABLE_STARTTLS_AUTO"]
}