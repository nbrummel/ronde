class DashboardController < ApplicationController
	def index
		unless current_user
			redirect_to '/users/sign_in'
		end
		@events = current_user.all_events.uniq.first(5).sort{ |a,b| b.start <=> a.start }
		@invitations = Invitation.find_all_by_invited_user_id(current_user.id).uniq.sort{ |a,b| b.event.start <=> a.event.start }
		
	end
end
