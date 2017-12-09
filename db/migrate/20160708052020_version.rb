class Version < ActiveRecord::Migration
  def change
   add_column :versions, :date, :date
   add_column :versions, :version, :string
   add_column :versions, :location, :string
  end
end
