class ApplicationController < ActionController::Base
  protect_from_forgery

  # These two methods are here only for the purposes of testing the google and facebook
  # callbacks. As you can see, they don't do anything except test that the oauth environment
  # doesn't fail catastrophically, and then redirect to the root page. No Users are added
  # so nothing is saved to the database. Later we will delete these methods and implement
  # a callback controller to handle these callbacks.
  def google
  	auth = request.env['omniauth.auth']
  	redirect_to "/"
  end

end
