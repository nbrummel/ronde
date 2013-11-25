class UserController < ApplicationController
	before_filter :check_login
	before_filter :get_user_and_friend

	def get_user_and_friend
		@user = User.find_by_id(params[:id])
		if params[:friend_id]
			@friend = User.find_by_id(params[:friend_id])
		end
	end

	def check_login
		if not current_user
			redirect_to "/static/home"
		end
	end

	def friends
		@friends = @user.accepted_friends
		if @friends.empty?
			@friends = false
		end
		@friend_requests = @user.requested_friends
		if @friend_requests.empty?
			@friend_requests = false
		end
	end
	def search_friend
		if params[:searched_friend] != ""
			@possible_friends = (User.where("email LIKE ?", "%#{params[:searched_friend]}%") + 
								User.where("first_name LIKE ?", "%#{params[:searched_friend]}%") + 
								User.where("last_name LIKE ?", "%#{params[:searched_friend]}%") + 
								User.where("phone_number LIKE ?", "%#{params[:searched_friend]}%")).uniq
			@possible_friends.delete(current_user)
			if @possible_friends.empty?
				flash[:search_result_msg] = "Sorry, no users matching #{params[:searched_friend]} have been found."
			end
		else
			redirect_to "/user/#{params[:id]}/friends"
		end
	end
	def add_friend
		Friendship.request(@user, @friend)
		flash[:friend_request_msg] = "You have successfully sent #{@friend.first_name} #{@friend.last_name} a friend request."
		redirect_to self.toFriends
	end
	def accept_friend
		Friendship.accept(@user, @friend)
		flash[:accept_friend_msg] = "You and #{@friend.first_name} #{@friend.last_name} are now friends."
		redirect_to self.toFriends
	end
	def remove_friend
		Friendship.remove(@user, @friend)
		flash[:remove_friend_msg] = "You have removed #{@friend.first_name} #{@friend.last_name} from your friends."
		redirect_to self.toFriends
	end
	
	def reject_friend
		Friendship.remove(@user, @friend)
		redirect_to self.toFriends
	end

	def toFriends
		"/user/#{params[:id]}/friends"
	end
end
