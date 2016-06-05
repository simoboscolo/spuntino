class Recipe < ActiveRecord::Base

	has_many :comments, dependent: :destroy
	belongs_to :user

	has_attached_file :avatar, :styles =>
		{ :medium => "300x300>", :thumb => "100x100>" },
		:default_url => "/images/missing.png"
	validates_attachment_content_type :avatar,
		:content_type => /\Aimage\/.*\Z/

	validates :name, presence: true
	validates :preparation_time, numericality: { only_integer: true, less_than_or_equal_to: 20 }
	validates :ingredients, presence: true
	validates :procedure, presence: true

end
