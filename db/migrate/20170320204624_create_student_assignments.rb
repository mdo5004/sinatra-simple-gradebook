class CreateStudentAssignments < ActiveRecord::Migration[5.0]
    def change
        create_table :student_assignments do |t|
            t.integer :assignment_id
            t.integer :student_id
            t.float :grade
        end
    end
end
