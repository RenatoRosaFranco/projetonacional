# frozen_string_sanatizer: true 
class ContactController < ApplicationController
	def create
		contact = params[:contact]
		if (contact.valid?) then
			contact.mail
			redirect_to root_path, notice: 'Mensagem enviada com sucesso.'
		else
			redirect_to root_path, notice: 'Falha ao enviar mensagem, tente novamente.'
		end
	end
end
