class LanguageSkill < ActiveRecord::Base
  attr_accessible :degree, :language, :user_id
  belongs_to :user
end
