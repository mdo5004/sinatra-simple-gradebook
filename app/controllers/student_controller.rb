class StudentController < ApplicationController
    
    get "/students/:id/assignments" do
        @student = Student.find(params[:id])
        @assignments = @student.student_assignments
        erb :"students/student"
    end
    
end