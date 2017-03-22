class ClassesController < ApplicationController
    get "/classes" do 
        if logged_in?
            @teacher = Teacher.find(current_user)
            session[:page]="classes"
            erb :"classes/index"
        else
            redirect "/login"
        end
    end
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
        redirect "/classes/#{params[:id]}"
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
end