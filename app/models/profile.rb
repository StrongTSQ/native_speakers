class Profile < ActiveRecord::Base
  attr_accessible :city, :country, :native_language, :user_id
  validates_presence_of :native_language, :user_id
  belongs_to :user
end
