class Appointment < ActiveRecord::Base
  attr_accessible :from, :requester_id, :status, :to, :topic, :tutor_id, :proficiency
  belongs_to :requester, class_name: 'User'
  belongs_to :tutor, class_name: 'User'
end
