class LeavedatesController < ApplicationController

#before_filter :user_signed_in

  def create
  	date = Date.strptime(params[:leavedate][:date], "%m/%d/%Y")
    @leavedate = current_user.leavedates.build(date: date)
    puts @leavedate.date
    if @leavedate.save
      flash[:success] = "Leave created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end
  
  def destroy
  end
def show
	@leavedate = Leavedate.new
end
end
