class DropAbsences < ActiveRecord::Migration[5.0]
  def change
    drop_table :absences
  end
end
