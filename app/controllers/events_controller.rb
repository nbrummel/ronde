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
			respond_to do |format|
		    if @event.save
		      format.html { redirect_to @event, notice: 'event was successfully created.' }
		      format.json { render json: @event, status: :created, location: @event }
		    else
		      format.html { render action: "new" }
		      format.json { render json: @event.errors, status: :unprocessable_entity }
		    end
		  end
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
				flash[:error] = "The start time cant be before the current time"
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

