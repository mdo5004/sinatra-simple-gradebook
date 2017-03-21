class StudentController < ApplicationController
    
    get "/students/:id/assignments" do
        @student = Student.find(params[:id])
        @assignments = @student.student_assignments
        erb :"students/student"
    end
    
    get "/students/:id/edit" do
    end
    
    get "/students/new" do
    end
    
    post "/students/new"
    
end