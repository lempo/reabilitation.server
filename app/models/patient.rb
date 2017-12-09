class Patient < ActiveRecord::Base
  has_many :results
  has_many :tasks, :through => :results
end
