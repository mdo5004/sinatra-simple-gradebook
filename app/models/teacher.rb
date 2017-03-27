class Teacher < ActiveRecord::Base
    has_many :klasses
    has_many :students, through: :klasses

    validates :first_name, :last_name, :email, presence: true
    validates :email, uniqueness: true
    
    has_secure_password
end