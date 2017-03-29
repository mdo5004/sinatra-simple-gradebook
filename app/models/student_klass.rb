require 'pry'
class StudentKlass < ActiveRecord::Base
    belongs_to :klass
    belongs_to :student
    
    before_save :add_missing_assignments
    
    def add_missing_assignments
        self.klass.assignments.each do |assignment|
            self.student.assignments << assignment unless self.student.assignments.include?(assignment)
        end
    end
end