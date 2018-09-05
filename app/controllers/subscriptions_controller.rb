# frozen_string_sanatizer: true
class SubscriptionsController < ApplicationController

	def create
		@subscription = Subscription.new(subscription_params)
		respond_to do |format|
			if  @subscription.save 
				format.html { redirect_to @subscription, notice: 'Inscrição realizada com sucesso..' }
		        format.json { render :show, status: :created, location: subscription }
		        format.js   { render layout: false }
			else 
		        format.html { render :new }
		        format.json { render json: @subscription.errors, status: :unprocessable_entity }
			end
		end
	end

	private
		def subscription_params
			params.require(:subscription)
				.permit(:name, :email, :profile)
		end
end
