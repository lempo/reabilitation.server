class AddCreationToLicencekeys < ActiveRecord::Migration
  def change
    add_column :licencekeys, :creation, :date
  end
end
