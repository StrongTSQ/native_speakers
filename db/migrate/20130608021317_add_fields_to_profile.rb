class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :gender, :string
    add_column :profiles, :birth_date, :date
    add_column :profiles, :education, :string
    add_column :profiles, :major, :string
    add_column :profiles, :job, :string
  end
end
