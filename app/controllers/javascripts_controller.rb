class JavascriptsController < ApplicationController
	def dynamic_users
		@states = User.find(:all)
  	end
end
