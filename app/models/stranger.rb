class Stranger < ActiveRecord::Base
  validates :session_id, presence: true, uniqueness: true, :length => { :minimum => 2 }
end
