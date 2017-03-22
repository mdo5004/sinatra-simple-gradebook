class StudentController < ApplicationController

    get "/students/:id/edit" do
        if logged_in? 
            #all teachers can edit students?
            @student = Student.find(params[:id])
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
    get "/students/:id" do
        if logged_in?
            @student = Student.find(params[:id])
            @assignments = @student.student_assignments
            erb :"students/student"
        else
            redirect "/login" 
        end

    end


    post "/students/:id/edit" do
        Student.find(params[:id]).update(params[:student])
        redirect "/students/#{params[:id]}"
    end
    post "/students/new" do
        if params[:student][:name] != ''
            @student = Student.create(params[:student])
            flash[:success] = "Student created!"
            redirect "/students"
        else 
            flash[:error]="Your student must have a name"
            redirect "/students/new"
        end
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