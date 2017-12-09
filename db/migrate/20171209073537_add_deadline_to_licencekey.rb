class AddDeadlineToLicencekey < ActiveRecord::Migration
  def change
    add_column :licencekeys, :deadline, :date
  end
end
