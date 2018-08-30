# frozen_string_sanatizer: true
class SubscriptionsController < ApplicationController

	def create
		subscription = Subscription.new(subscription_params)
		if subscription.save 
			return redirect_to root_path, notice: 'Registrado com sucesso.'
		else
			return redirect_to root_path, notice: 'Falha, tente novamente mais tarde'
		end
	end

	private
		def subscription_params
			params.require(:subscription)
				.permit(:name, :email, :profile)
		end
end
