class HomeController < ApplicationController
  def index
  	if current_user.present?
  		@greeting = "#{current_user.name} 谢谢你登陆了我们网站！你已经登陆了#{current_user.sign_in_count}次了，总共登陆时间是#{stay_minutes current_user}分钟了。"
  	else
  		@greeting = "你好，陌生人！你没有登陆，或者你还没有注册，但是你已经浏览这个页面#{stay_minutes @stranger}分钟了。"
  	end
  	@stat = "现在总共有#{total_user_online_number}个注册用户在查看这个网站，有#{total_stranger_online_number}个陌生人在查看这个网站。"
  end

  def record_stay_time
    stay_sec = params[:stay_seconds].to_i
  	if current_user.present?
  		current_user.stay_seconds += stay_sec
  		current_user.save
  	else
  		@stranger = Stranger.find_or_create_by(session_id: session['session_id'])
  		@stranger.stay_seconds += stay_sec
  		@stranger.save
  	end

    respond_to do |format|
        format.json { head :no_content }
    end
  end

  def stay_time

  end
end
