class ClassesController < ApplicationController
    get "/classes" do 
        
        erb :"classes/index"
    end
end