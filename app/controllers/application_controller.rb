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

end