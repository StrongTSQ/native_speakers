class AvailableHour < ActiveRecord::Base
  attr_accessible :friday_from, :friday_to, :monday_from, :monday_to, :profile_id, :saturday_from, :saturday_to, :sunday_from, :sunday_to, :thursday_from, :thursday_to, :tuesday_from, :tuesday_to, :wednesday_from, :wednesday_to, :time_zone
  belongs_to :profile
end
