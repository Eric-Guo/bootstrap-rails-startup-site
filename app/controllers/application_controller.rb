class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initial_or_add_stay_time

  def initial_or_add_stay_time
  	if current_user.present?

  	else
  		@stranger = Stranger.find_or_create_by(session_id: session['session_id'])
  		@stranger.stay_seconds += 1
  		@stranger.save
  	end
  end
end
