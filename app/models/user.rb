class User < ActiveRecord::Base

	has_many :recipes
	has_many :comments

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	      :recoverable, :rememberable, :trackable, :validatable

	has_attached_file :avatar, :styles =>
		{ :medium => "300x300>", :thumb => "100x100>" },
		:default_url => "/images/user.png"
	validates_attachment_content_type :avatar,
		:content_type => /\Aimage\/.*\Z/      
end
