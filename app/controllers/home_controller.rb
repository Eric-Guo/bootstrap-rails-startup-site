class HomeController < ApplicationController
  def index
  	if current_user.present?
  		@greeting = "#{current_user.name} 谢谢你登陆了我们网站！你已经登陆了#{current_user.sign_in_count}次了，总共登陆时间是#{stay_minutes current_user}分钟了。"
  	else
  		@greeting = "你好，陌生人！你没有登陆，或者你还没有注册，但是你已经浏览这个页面#{stay_minutes @stranger}分钟了。"
  	end
  	@stat = "现在总共有#{User.where('updated_at > ?', 3.minutes.ago).size}个注册用户在查看这个网站，有#{Stranger.where('updated_at > ?', 3.minutes.ago).size}个陌生人在查看这个网站。"
  end
end
