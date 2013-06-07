class AddUserIdToLanguageSkills < ActiveRecord::Migration
  def change
    add_column :language_skills, :user_id, :integer
  end
end
