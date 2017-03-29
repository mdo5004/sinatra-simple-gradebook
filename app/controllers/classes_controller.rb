class ClassesController < ApplicationController

    get "/classes" do 
        if logged_in?
            @teacher = current_teacher
            session[:page]="classes"
            erb :"classes/index"
        else
            redirect "/login"
        end
    end

    get "/classes/new" do
        if logged_in?
            erb :"classes/new"
        else
            redirect "/login"
        end
    end

    post "/classes" do
        @klass = current_teacher.klasses.build(params[:klass])
        
        if !params[:student][:name].empty?
            @student = Student.new(params[:student])
#binding.pry
            if @student.save && @klass.save
                params[:klass][:student_ids] << @student.id
            else
                flash[:warning] = "Tried to create new student: " + @student.errors.full_messages.join(", ")
            end
        end
        if @klass.save
            flash[:success] = "Class successfully created"
            redirect "/classes/#{@klass.id}"
        else
            flash[:error] = @klass.errors.full_messages.join(", ")
            redirect "/classes/new"
        end
    end

    get "/classes/:id" do
        if logged_in?
            @klass = Klass.find_by(id: params[:id])
            session[:page]="classes"
            erb :"classes/show"
        else
            redirect "/login"            
        end
    end

    get "/classes/:id/edit" do
        @klass = Klass.find_by(id: params[:id])
        if @klass.teacher == current_teacher
            session[:page]="classes"
            erb :"classes/edit"
        else
            flash[:error] = "You can't edit that class"
            redirect "/classes"
        end
    end

    put "/classes/:id" do

        @klass = Klass.find_by(id: params[:id])
        if !params[:student][:name].empty?
            @student = Student.new(params[:student])
            if @student.save && @klass.save
                binding.pry
                params[:klass][:student_ids] << @student.id
            else
                flash[:warning] = "Tried to create new student: " + @student.errors.full_messages.join(", ")
            end
        end

        if @klass.update(params[:klass])
            flash[:success] = "Class successfully edited"
            redirect "/classes/#{params[:id]}"
        else
            flash[:error] = @klass.errors.full_messages.join(", ")
            redirect "/classes/#{params[:id]}/edit"
        end
    end





end