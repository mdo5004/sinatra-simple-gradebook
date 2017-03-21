class StudentController < ApplicationController

    get "/students/:id/assignments" do
        if logged_in?
            @student = Student.find(params[:id])
            @assignments = @student.student_assignments
            erb :"students/student"
        else
            redirect "/login" 
        end
    end

    get "/students/:id/edit" do
        if logged_in?
            erb :"students/edit"
        else
            redirect "/login" 
        end
    end

    get "/students/new" do
        if logged_in?
            erb :"students/new"
        else
            redirect "/login" 
        end
    end

    post "/students/new" do
        @student = Student.create(params[:student])
        redirect "/students"
    end

    get "/students" do
        if logged_in?
            @students = Student.all
            erb :"students/index"
        else
            redirect "/login" 
        end

    end

end