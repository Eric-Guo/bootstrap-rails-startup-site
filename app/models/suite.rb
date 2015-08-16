class Suite < ActiveRecord::Base
  belongs_to :project
  has_many :cases
end
