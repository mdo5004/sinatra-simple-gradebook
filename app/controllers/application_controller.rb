require "pry"
require 'sinatra/flash'
class ApplicationController < Sinatra::Base
    configure do
        #set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        register Sinatra::Flash
        set :session_secret, "iknowhowtoplaytheblackkeys"
    end

    helpers do
        def logged_in?
            !!current_teacher 
        end

        def current_teacher
            @current_teacher ||= Teacher.find_by(id: session[:teacher_id])
        end

        def current_page
            session[:page]
        end
    end
    get '/' do
        if logged_in?
            
            session[:page]='home'
            erb :index
        else
            session[:page]='login'
            erb :"/users/login"
        end   
    end

    get '/signup' do

        if logged_in?
            redirect '/classes'  
        else
            erb :'/users/create_login'
        end
    end

    post '/signup' do
        redirect to "/classes" if logged_in?
        @teacher = Teacher.new(params)
        if @teacher.save 
            session[:teacher_id] = @teacher.id
            flash[:message] = "Welcome #{@teacher.first_name}!"
            redirect '/classes'
        else 
            flash[:error] = @teacher.errors.full_messages.join(", ")
            erb :'/users/create_login'
        end
    end

    get '/login' do
        if logged_in?
            erb :index
        else
            session[:page]="login"
            erb :"/users/login"
        end
    end

    post '/login' do
        @teacher = Teacher.find_by(email: params[:email])
        if @teacher && @teacher.authenticate(params[:password]))
            session[:teacher_id] = @teacher.id
            redirect '/classes'
        else
            redirect '/login'
        end
    end

    get "/logout" do
        session.clear
        redirect "/login"
    end


end