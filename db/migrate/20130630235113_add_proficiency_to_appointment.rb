class AddProficiencyToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :proficiency, :string
  end
end
