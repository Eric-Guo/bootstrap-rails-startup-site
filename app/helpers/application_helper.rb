module ApplicationHelper
	def stay_minutes(person)
		sec = person.try :stay_seconds || 0
		(sec/60).round(1)
	end
end
