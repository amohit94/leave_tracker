class LeavedatesController < ApplicationController

#before_filter :user_signed_in
before_filter :correct_user,   only: :destroy
  def create
  	date = Date.strptime(params[:leavedate][:date], "%m/%d/%Y")
    @leavedate = current_user.leavedates.build(date: date, description: params[:leavedate][:description])
    #puts @leavedate.date
    if @leavedate.save
      flash[:success] = "Leave created!"
      redirect_to root_url
    else
      #@leavedate.destroy
      #debugger
      render 'leavedates/add_leavedate'
    end
  end
  
  def destroy
    @leavedate.destroy
    redirect_to root_url
  end

def show
  #debugger
	#@leavedate ||= Leavedate.new
end

private
  
    def correct_user
      @leavedate = current_user.leavedates.find_by_id(params[:id])
      redirect_to root_url if @leavedate.nil?
    end
end
