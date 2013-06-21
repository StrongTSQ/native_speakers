class AddTimeZoneToAvailableHours < ActiveRecord::Migration
  def change
    add_column :available_hours, :time_zone, :string
  end
end
