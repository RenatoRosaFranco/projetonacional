# frozen_string_sanatizer: true
class Subscription < ApplicationRecord
	self.table_name = 'subscriptions'
	self.primary_key = 'id'

	validates :name,
			  presence: true,
			  uniqueness: false,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 30 }

	validates :email,
			  presence: true,
			  uniqueness: true,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 145 }

	validates :profile,
			  presence: true,
			  uniqueness: false,
			  allow_blank: false,
			  length: { minimum: 3, maximum: 140 }
end
