# Case used to record....
class Case < ActiveRecord::Base
  belongs_to :project
  belongs_to :tester_user, class_name: :User
  belongs_to :suite
end
