class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :native_language
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
