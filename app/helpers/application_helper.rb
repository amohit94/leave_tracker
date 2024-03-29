module ApplicationHelper
	# Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "Leave Tracker"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def initial_authenticate
  	if signed_in?
  		authenticate_user!
  	end
  end
end
