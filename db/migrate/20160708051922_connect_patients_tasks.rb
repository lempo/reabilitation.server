class ConnectPatientsTasks < ActiveRecord::Migration
  def change
   add_column :results, :patient_id, :integer
   change_column_null :results, :patient_id, false
   add_column :results, :task_id, :integer
   change_column_null :results, :task_id, false
   add_column :results, :date, :date
   add_column :results, :result, :integer
  end
end
