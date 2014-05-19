class StaticPagesController < ApplicationController
	def home
		#@leavedate = current_user.leavedates if user_signed_in?
		@leavedates = current_user.leavedates
  end

  def help
  end

  def about
  end

  def contact
  end
end
