class Key < ActiveRecord::Migration
  def change
   add_column :keys, :key, :string
   add_column :keys, :username, :string
   add_column :keys, :hddserial, :string
   add_column :keys, :starttime, :date
   add_column :keys, :endtime, :date
  end
end
