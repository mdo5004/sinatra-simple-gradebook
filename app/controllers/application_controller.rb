class ApplicationController < Sinatra::Base
    configure do
        #set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
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
        session[:page]='home'
        erb :index
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
            if params[:username] != '' && params[:password] != '' && params[:email] != ''
                @user = User.create(params)
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
            redirect "/classes"
        else
            erb :"/users/login"
        end
    end

    post '/login' do

        if params[:username] != '' && params[:password] != ''
            user = User.find_by(username: params[:username])
        end
        if !!(user && user.authenticate(params[:password]))
            session[:id] = user.id
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