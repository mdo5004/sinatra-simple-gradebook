class Student < ActiveRecord::Base
    has_many :student_assignments, dependent: :destroy
    has_many :assignments, through: :student_assignments
    
    has_many :student_klasses
    has_many :klasses, through: :student_klasses
    has_many :teachers, through: :klasses
    
    validates :name, presence: true
    validates :name, length: {minimum: 2, maximum: 20}
    
    after_update do
        "Student updated"
    end
end