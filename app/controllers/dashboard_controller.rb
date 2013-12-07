class DashboardController < ApplicationController
	before_filter :check_login

	def check_login
		redirect_to "/static/home" unless current_user
	end

	def index
		if current_user && current_user.sign_in_count == 1
      		current_user.sign_in_count += 1
      		current_user.save
      		redirect_to "/static/tour" and return
      	end
		@event = Event.new
		@events = current_user.all_events.uniq.first(5).sort{ |a,b| b.start <=> a.start }
		@invitations = Invitation.find_all_by_invited_user_id(current_user.id).uniq.sort{ |a,b| b.event.start <=> a.event.start }
		@feed = []
		current_user.accepted_friends.each { |friend| friend.all_events.select{ |event| event.created_by_id != current_user.id }.each { |e| @feed << [friend, e] } }
		@feed = @feed.sort{ |a,b| b.last.start <=> a.last.start}
	end
end
