class Leavedate < ActiveRecord::Base
	attr_accessible :user_id, :date
	belongs_to :user
	validates :date, presence: true, uniqueness: true
	validate :date_cannot_be_in_the_past
	validates :user_id, presence: true


	def date_cannot_be_in_the_past
		errors.add(:date, "can't be in the past") if !date.blank? and date < Date.today 
	end
end
