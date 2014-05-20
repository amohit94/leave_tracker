class Leavedate < ActiveRecord::Base
	attr_accessible :user_id, :date, :description
	belongs_to :user
	validates :date, :uniqueness => { :scope => :user_id }
	validates :date, presence: true
	validate :date_cannot_be_in_the_past
	validate :date_cannot_be_in_weekend
	validates :user_id, presence: true
	default_scope order: 'leavedates.date ASC'

	def date_cannot_be_in_the_past
		errors.add(:date, "has already passed") if !date.blank? and date < Date.today 
	end
	def date_cannot_be_in_weekend
		errors.add(:date, "is in a weekend") if date.saturday? or date.sunday?
	end
end
