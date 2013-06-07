class CreateLanguageSkills < ActiveRecord::Migration
  def change
    create_table :language_skills do |t|
      t.string :language
      t.string :degree

      t.timestamps
    end
  end
end
