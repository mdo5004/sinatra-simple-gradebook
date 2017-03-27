require 'pry'
class Assignment < ActiveRecord::Base
    has_many :student_assignments
    has_many :students, through: :student_assignments

    belongs_to :klass

    after_create :assign_to_students

    
    def assign_to_students
        self.klass.students.each do |student|
        #if student.student_assignments.where(assignment_id: self.id).empty?
            student.assignments << self
           # end
        end
    end
end
