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
            !session[:id].nil?
        end

        def current_user
            session[:id] 
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
        if !logged_in?
            if params[:first_name] != '' && params[:last_name] != '' && params[:password] != '' && params[:email] != ''
                @user = Teacher.create(params)
                session[:id] = @user.id
                redirect '/classes'
            else
                #message = all fields must be filled out
                redirect "/signup"
            end
        else
            # logged in means you can't view sign up page
            redirect "/classes"
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

        if params[:email] != '' && params[:password] != ''
            @user = Teacher.find_by(email: params[:email])
        end

        if !!(@user && @user.authenticate(params[:password]))
            session[:id] = @user.id
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