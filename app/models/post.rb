# frozen_string_sanatizer: true
class Post < ApplicationRecord
  self.table_name  = 'posts'
  self.primary_key = 'id'
  
  belongs_to :user
  has_and_belongs_to_many :categories
  enum status: [:published, :review, :unpublished]

  validates  :title,
  		     presence: true,
  		     uniqueness: false,
  		     allow_blank: false,
  		     length: { minimum: 3, maximum: 40 }

  validates  :description,
  			 presence: true,
  			 uniqueness: false,
  			 allow_blank: false,
  			 length: { minimum: 3, maximum: 145 }

  validates  :content,
  			 presence: true,
  			 uniqueness: false,
  			 allow_blank: false,
  			 length: { minimum: 3, maximum: 20_000 }

  validates  :status,
  			 presence: true,
  			 uniqueness: false,
  			 allow_blank: false,
  			 numericality: { only_integer: true }

  validates  :tags,
  			 presence: true,
  			 uniqueness: false,
  			 allow_blank: false,
  			 length: { minimum: 3, maximum: 70 }
end
