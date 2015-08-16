class Project < ActiveRecord::Base
  has_many :cases
  has_many :suites
  has_many :suites_cases, through: :suites
end
