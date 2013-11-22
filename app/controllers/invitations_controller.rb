class InvitationsController < ApplicationController
	before_filter :check_login

	def check_login
		redirect_to "/static/home" unless current_user
	end

	def show_all
		@invitations = Invitation.find_all_by_invited_user_id(current_user.id).uniq
	end

	def accept
		@invitation = Invitation.find(params[:id])
		Invitation.accept(@invitation.user, @invitation.invited_user, @invitation.event)
		redirect_to "/events/#{@invitation.event.id}"
	end

	def search
	end

	def decline
		@invitation = Invitation.find(params[:id])
		if @invitation
			Invitation.destroy(@invitation.id)
		end
		redirect_to '/invitation/show/all'
	end
end