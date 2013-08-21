class ChangeSettingofAppointments < ActiveRecord::Migration
  def up
  	remove_column :appointments, :date
  	change_column :appointments, :from, :datetime
  	change_column :appointments, :to, :datetime
  	change_column_default :appointments, :status, 'pending'
  end

  def down
  	add_column :appointments, :date, :date
  	change_column :appointments, :from, :time
  	change_column :appointments, :to, :time
  	change_column_default :appointments, :status, default: nil
  end
end
