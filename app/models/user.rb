# frozen_string_sanatizer: true
class User < ApplicationRecord
  self.table_name = 'users'
  self.primary_key = 'id'

  has_many :categories, dependent: :nullify
  has_many :posts, dependent: :nullify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
