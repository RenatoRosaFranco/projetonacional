# frozen_string_sanatizer: true
module MailerInterfaceable
	include ActiveSupport::Concern

	private
		def sendEmail(mailer_class, method, object, delivery_method)
			mailer_class.send(method, object).send(delivery_method)
		end
end