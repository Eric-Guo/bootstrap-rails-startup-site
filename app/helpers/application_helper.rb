module ApplicationHelper
	def stay_minutes(person)
		sec = person.try :stay_seconds || 0
		(sec/60).round(1)
	end

	def total_user_online_number
		User.where('updated_at > ?', 3.minutes.ago).size
	end

	def total_stranger_online_number
		Stranger.where('updated_at > ?', 3.minutes.ago).size
	end
end
