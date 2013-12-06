class DashboardController < ApplicationController
	before_filter :check_login

	def check_login
		redirect_to "/static/home" unless current_user
	end

	def index
		@event = Event.new
		@events = current_user.all_events.uniq.first(5).sort{ |a,b| b.start <=> a.start }
		@invitations = Invitation.find_all_by_invited_user_id(current_user.id).uniq.sort{ |a,b| b.event.start <=> a.event.start }
		@feed = []
		current_user.accepted_friends.each { |friend| friend.all_events.select{ |event| event.created_by_id != current_user.id }.each { |e| @feed << [friend, e] } }
		@feed = @feed.sort{ |a,b| b.last.start <=> a.last.start}
	end
end
