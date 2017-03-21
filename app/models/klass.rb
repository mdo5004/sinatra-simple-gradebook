class Klass < ActiveRecord::Base
    has_many :student_klasses
    has_many :students, through: :student_klasses
    has_one :teacher
end