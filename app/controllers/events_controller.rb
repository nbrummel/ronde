class EventsController < ApplicationController
	before_filter :set_timezone, :check_login

	def set_timezone
		Time.zone
	end

	def check_login
		if not current_user
			redirect_to "/static/home"
		end
	end

	def index
		redirect_to '/events/new'
	end

	def new
	end

	def create
		if current_user
			@event, @flag = Event.new_event(params[:event], current_user)
		else
			redirect_to "/"
		end
		if @flag.empty?
			flash[:message] = "Event successfully created."
			redirect_to "/events/#{@event.id}"
		else
			if @flag['name']
				flash[:error] = "Name can't be blank"
			elsif @flag['description']
				flash[:error] = "Description can't be blank"
			elsif @flag['location']
				flash[:error] = "Location can't be blank"
			elsif @flag['event_type']
				flash[:error] = "Event type can't be blank"
			# TODO: add better check for time valif
			# elsif @flag['start']
			# 	flash[:error] = "The start time can't be before the current time"
			end
			render '/events/new'
		end
	end

	def update
	end

	def invite
		@event = Event.find(params[:id])
	end

	def show
		if params[:id]
			@event = Event.find(params[:id])
		else
			redirect_to user_dashboard_path
		end
		if @event.created_by == current_user or @event.invited_users.include?(current_user) or @event.attending_users.indlude?(current_user)
			@event
		else
			redirect_to user_dashboard_path
		end
	end

	def destroy
	end
end