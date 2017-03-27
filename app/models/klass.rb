class Klass < ActiveRecord::Base
    has_many :student_klasses
    has_many :students, through: :student_klasses
    belongs_to :teacher
    
    has_many :assignments
    
    validates :name, :description, presence: true
    validates :name, uniqueness: true
end