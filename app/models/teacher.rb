class Teacher < ActiveRecord::Base
    has_secure_password
    has_many :klasses
    has_many :students, through: :klasses
end