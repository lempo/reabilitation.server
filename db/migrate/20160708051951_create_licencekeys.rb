class CreateLicencekeys < ActiveRecord::Migration
  def change
    create_table :licencekeys do |t|
      t.string :key

      t.timestamps null: false
    end
  end
end
