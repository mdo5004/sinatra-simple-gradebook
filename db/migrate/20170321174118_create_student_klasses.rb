class CreateStudentKlasses < ActiveRecord::Migration[5.0]
    def change
        create_table :student_klasses do |t|
            t.integer :klass_id
            t.integer :student_id
        end
    end
end
