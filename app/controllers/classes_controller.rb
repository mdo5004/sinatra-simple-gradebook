class ClassesController < ApplicationController
    get "/classes" do 
        @teacher = Teacher.find(current_user)
        erb :"classes/index"
    end
end