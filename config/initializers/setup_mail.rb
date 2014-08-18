ActionMailer::Base.smtp_settings = {
	:address				=> ENV["EMAIL_ADDRESS"]
	:port					=> 587,
	:domain					=> ENV["EMAIL_DOMAIN"]
	:user_name				=> ENV["EMAIL_USER_NAME"]
	:password				=> ENV["EMAIL_PASSWORD"]
	:authentication			=> ENV["EMAIL_AUTHENTICATION"]
	:enable_starttls_auto	=> true
}