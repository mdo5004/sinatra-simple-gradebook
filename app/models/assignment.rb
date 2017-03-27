require 'pry'
class Assignment < ActiveRecord::Base
    has_many :student_assignments
    has_many :students, through: :student_assignments

    belongs_to :klass
    
    validates :name, presence: true
    
    after_create :assign_to_students

    def assign_to_students
        self.klass.students.each do |student|
        
            student.assignments << self
        
        end
    end
end
