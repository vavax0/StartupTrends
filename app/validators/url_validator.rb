require "net/http"

class UrlValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)

		url = URI.parse(value)
		Net::HTTP.start(url.host, url.port) do |http|
			http.head(url.request_uri).code != '404'
		end

		rescue
			false
			record.errors[attribute] << (options[:message] || "wrong website URL")
	end

end
