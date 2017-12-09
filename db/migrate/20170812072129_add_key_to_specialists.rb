class AddKeyToSpecialists < ActiveRecord::Migration
  def change
    add_column :specialists, :key, :string
  end
end
