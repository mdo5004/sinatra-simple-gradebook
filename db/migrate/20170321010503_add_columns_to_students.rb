class AddColumnsToStudents < ActiveRecord::Migration[5.0]
    def change
        add_column :students, :grade, :integer
        add_column :students, :parent_guardian1, :string
        add_column :students, :parent_guardian2, :string
        add_column :students, :address, :string
    end
end
