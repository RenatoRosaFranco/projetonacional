# frozen_string_sanatizer: true
class Contact
	extend ActiveModel::Conversion
	extend ActiveModel::Validations
	include MailerInterfaceable

	attr_accessor :name, :email, :subject, :message

	def initialize(params = {})
		@name = params[:name]
		@email = params[:email]
		@subject = params[:subject]
		@message = params[:message]
	end

	def persisted?
		false
	end

	def mail
		sendEmail(ContactMailer, :sended, self, :deliver_now)
		sendEmail(ContactMailer, :received, self, :deliver_now)
	end

	validates :name,
			  presence: true,
			  uniqueness: false,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 30 }

	validates :email,
			  presence: true,
			  uniquness: false,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 145 }

	validates :subject,
			  presence: true,
			  uniqueness: false,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 145 }

	validates :mes:sage,
			  presence:  true,
			  uniqueness: false,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 4_000 }
end	