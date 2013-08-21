class Profile < ActiveRecord::Base
  attr_accessible :city, :country, :native_language, :user_id, :gender, :birth_date, :education, :major, :job
  validates_presence_of :native_language, :user_id
  belongs_to :user
  has_many :available_hours
  
  scope :by_native_language, lambda{ |l|
  	where("native_language = ?", l)
  }

  def available_hour
  	return available_hours.first
  end

  def available_slots(date=Date.today)
    week_day = date.strftime("%A").downcase
    from = self.available_hour.send("#{week_day}_from")
    to = self.available_hour.send("#{week_day}_to")
    start = from
    slots = []
    while(start+30*60 < to)
      slots << [start, start+30*60]
      start = start + 30*60
    end
    slots
  end
end

