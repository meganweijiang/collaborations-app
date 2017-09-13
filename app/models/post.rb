class Post < ApplicationRecord
	belongs_to :user
	has_many :interests, through: :users
end
