class EventsController < ApplicationController
	before_filter :set_timezone

	def set_timezone
		Time.zone
	end

	def index
		redirect_to '/events/new'
	end

	def new
	end

	def create
		if current_user
			@event, @flag = Event.new_event(params[:event], current_user)
		end
		if @flag.empty?
			flash[:message] = "Event successfully created."
			redirect_to '/events/show'
		else
			if @flag['name']
				flash[:error] = "Name can't be blank"
			elsif @flag['description']
				flash[:error] = "Description can't be blank"
			elsif @flag['event_type']
				flash[:error] = "Event type can't be blank"
			elsif @flag['location']
				flash[:error] = "Location can't be blank"
			elsif @flag['start']
				flash[:error] = "The start time can't be before the current time"
			end
			redirect_to '/events/new'
		end
	end

	def update
	end

	def show
		@events = Event.find_all_by_created_by_id(current_user.id)
	end

	def destroy
	end
end