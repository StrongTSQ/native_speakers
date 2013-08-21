class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :topic
      t.integer :requester_id
      t.integer :tutor_id
      t.string :status
      t.time :from
      t.time :to
      t.date :date

      t.timestamps
    end
  end
end
