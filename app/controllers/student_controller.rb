class StudentController < ApplicationController
    get "/students" do
        if logged_in?
            @students = Student.all
            erb :"students/index"
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
    get "/students/:id/edit" do
        if logged_in? 
            #all teachers can edit students?
            @student = Student.find_by(id:params[:id])
            erb :"students/edit"
        else
            redirect "/login" 
        end
    end
    
    get "/students/:id" do
        if logged_in?
            @student = Student.find_by(id:params[:id])
            @assignments = @student.student_assignments
            erb :"students/student"
        else
            redirect "/login" 
        end

    end
    

    post "/students/new" do
        @student = Student.new(params[:student])
        if @student.save
            flash[:success] = "Student created!"
            redirect "/students"
        else 
            flash[:error]="Your student must have a name"
            redirect "/students/new"
        end
    end
    
    put "/students/:id/edit" do
        @student = Student.find_by(id:params[:id])
        if @student.update(params[:student])
            flash[:success] = "Student updated"
        else
            flash[:error] = @student.errors.full_messages.join(", ")
        end
        redirect "/students/#{params[:id]}"
    end
    

    

end