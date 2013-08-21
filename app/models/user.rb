class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  has_many :language_skills
  has_many :profiles

  def profile
    if self.profiles.blank?
      nil
    else
      self.profiles.first
    end
  end

  def languages
    result = []
    language_skills.each do |skill|
      result<<skill.language
    end
    result.uniq
  end

  def outgoing_appointments
    json_results = []
    Appointment.find_all_by_reqeuster_id(self.id).each do |app|
      if app.requester == self
        starting = app.from
        ending = app.to
        json_results << {title: app.topic, start: starting, end: ending, tutor_id: app.tutor_id}
      end
    end
    json_results
  end

  def incoming_appointments
    json_results = []
    Appointment.find_all_by_tutor_id(self.id).each do |app|
      if app.requester != self
        starting = app.from
        ending = app.to
        json_results << {title: app.topic, start: starting, end: ending, requester_id: app.requester.profile.id, requester: app.requester.username}
      end
    end
    json_results
  end
end
