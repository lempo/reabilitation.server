class Result < ActiveRecord::Base
  belongs_to :patient
  belongs_to :task
end
