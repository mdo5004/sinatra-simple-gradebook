class ClassesController < ApplicationController
    get "/classes" do 
        if logged_in?
            @teacher = Teacher.find(current_user)
            erb :"classes/index"
        else
            redirect "/login"
        end
    end
    get "/classes/:id/edit" do
        @klass = Klass.find(params[:id])
        erb :"classes/edit"
    end
    post "/classes/:id/edit" do
        @klass = Klass.find(params[:id])
        @klass.update(params[:klass])
        redirect "/classes/#{params[:id]}"
    end
    
    get "/classes/:id" do
        @klass = Klass.find(params[:id])
        erb :"classes/show"
    end
end