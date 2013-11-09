class EventsController < ApplicationController

	before_filter :set_timezone

	 def set_timezone
	   Time.zone
	 end

	def new
		
	end

	def create
		@event = Event.new 
		@event.created_by = current_user
		@event.attributes = params[:event]
		@event.save!
		redirect_to user_dashboard_path
	end



end
