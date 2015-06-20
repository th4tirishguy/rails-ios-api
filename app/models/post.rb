class Post < ActiveRecord::Base
	mount_uploader :image, PhotoUploader

	validates :title, presence: true
	validates :uploader_ip, presence: true
	validates :location, presence: true
	validates :image, presence: true
end
