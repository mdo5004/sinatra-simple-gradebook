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
    
    get "/classes/new" do
        if logged_in?
            erb :"classes/new"
        else
            redirect "/login"
        end
    end
    
    post "/classes" do
        if params[:klass][:name] != '' && params[:klass][:description] != ''
            @teacher = Teacher.find(current_user)
            @klass = @teacher.klasses.create(params[:klass])
            if params[:student][:name] != ''
                @klass.students.create(params[:student]) 
            end
            flash[:success] = "Class successfully created"
            redirect "/classes/#{@klass.id}"
        else
            flash[:error] = "Classes must have a name and description"
            redirect "/classes/new"
        end
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

    get "/classes/:id/edit" do
        if Klass.find(params[:id]).teacher_id == current_user
            @klass = Klass.find(params[:id])
            session[:page]="classes"
            erb :"classes/edit"
        else
            redirect "/classes"
        end
    end
    
    put "/classes/:id" do
        if params[:klass][:name] != '' && params[:klass][:description] != ''
            @klass = Klass.find(params[:id])
            @klass.update(params[:klass])
            if params[:student][:name] != ''
                @klass.students.create(params[:student]) 
            end
            flash[:success] = "Class successfully edited"
            redirect "/classes/#{params[:id]}"
        else
            flash[:error] = "Classes must have a name and description"
            redirect "/classes/#{params[:id]}/edit"
        end
    end

   

    
    
end