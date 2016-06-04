class Recipe < ActiveRecord::Base

	has_many :comments, dependent: :destroy

	validates :name, presence: true
	validates :preparation_time, numericality: { only_integer: true, less_than_or_equal_to: 20 }
	validates :ingredients, presence: true
	validates :procedure, presence: true

end
