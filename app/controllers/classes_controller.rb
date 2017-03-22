class ClassesController < ApplicationController

    get "/classes/:id/edit" do
        if Klass.find(params[:id]).teacher_id == current_user
            @klass = Klass.find(params[:id])
            session[:page]="classes"
            erb :"classes/edit"
        else
            redirect "/classes"
        end
    end
    post "/classes/:id/edit" do
        @klass = Klass.find(params[:id])
        @klass.update(params[:klass])
        if params[:student][:name] != ''
            @klass.students.create(params[:student]) 
        end
        redirect "/classes/#{params[:id]}"
    end

    get "/classes/new" do
        if logged_in?
            erb :"classes/new"
        else
            redirect "/login"
        end
    end
    post "/classes/new" do
        @teacher = Teacher.find(current_user)
        @teacher.klasses.create(params[:klass])
        redirect "/classes"
    end

    get "/classes/:id" do
        if logged_in?
            @klass = Klass.find(params[:id])
            session[:page]="classes"
            erb :"classes/show"
        else
            redirect "/login"            
        end
    end
    get "/classes" do 
        if logged_in?
            @teacher = Teacher.find(current_user)
            session[:page]="classes"
            erb :"classes/index"
        else
            redirect "/login"
        end
    end
end