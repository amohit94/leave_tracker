class User < ActiveRecord::Base
	acts_as_google_authenticated
end
