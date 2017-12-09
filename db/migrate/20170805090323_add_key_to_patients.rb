class AddKeyToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :key, :string
  end
end
