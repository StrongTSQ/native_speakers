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
end
