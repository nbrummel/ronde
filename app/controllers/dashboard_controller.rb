class DashboardController < ApplicationController
	def index
		unless current_user
			redirect_to '/users/sign_in'
		end
		
	end
end
