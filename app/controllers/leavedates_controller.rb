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
    #@x = @leavedate.user.leavedates.count
    respond_to do |format|
      format.html { 
        #user = User.find(@post.user_id)
        #redirect_to @user 
      }
      format.js
    end
    #redirect_to root_url
  end

def show
  #debugger
	#@leavedate ||= Leavedate.new
end

def edit
    @leavedate = Leavedate.find(params[:id])
    #redirect_to root_url
  end

  def update
    @leavedate = Leavedate.find(params[:id])
    date = Date.strptime(params[:leavedate][:date], "%m/%d/%Y")
    if @leavedate.update_attributes(date: date, description: params[:leavedate][:description])
      # Handle a successful update.
      flash[:success] = "Update successful"
      redirect_to root_url
    else
      flash[:error] = "Update failed"
      render 'edit'
    end
  end
private
  
    def correct_user
      @leavedate = current_user.leavedates.find_by_id(params[:id])
      redirect_to root_url if @leavedate.nil?
    end
end
