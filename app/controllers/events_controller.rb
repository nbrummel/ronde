class EventsController < ApplicationController
	before_filter  :check_login

	def check_login
		redirect_to "/static/home" unless current_user
	end

	def index
		redirect_to '/events/new'
	end

	def new
		@event = Event.new
	end

	def create
		@event, @flag = Event.new_event(params[:event], current_user)
		if @flag.empty?
			flash[:message] = "Event successfully created."
			redirect_to "/events/#{@event.id}" and return
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
			render 'new', event: 'new'
		end
	end

	def update
	end

	def invite
		@event = Event.find(params[:id])
	end

	def send_invites
		@user = current_user
		@friends_and_events = params[:friends]
		unless @friends_and_events.nil? 
			@friends_and_events.each do |friend_event|
				@event = Event.find(friend_event.last)
				@friend = User.find(friend_event.first)
				Invitation.invite(current_user, @friend, @event)
			end
			flash[:message] = "Invitations sent!"
		end
		redirect_to user_dashboard_path
	end

	def show
		if params[:id]
			@event = Event.find(params[:id])
		else
			redirect_to user_dashboard_path
		end
		if @event.created_by == current_user or @event.invited_users.include?(current_user) or @event.attending_users.include?(current_user)
			@event
		else
			redirect_to user_dashboard_path
		end
	end

	def show_all
		@events = current_user.all_events
	end

	def destroy
	end
end