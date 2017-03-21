class ClassesController < ApplicationController
    get "/classes" do 
        if logged_in?
            @teacher = Teacher.find(current_user)
            erb :"classes/index"
        else
            redirect "/login"
        end
    end
end