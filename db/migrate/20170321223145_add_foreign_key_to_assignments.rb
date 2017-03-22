class AddForeignKeyToAssignments < ActiveRecord::Migration[5.0]
  def change
      add_column :assignments, :klass_id, :integer
  end
end
