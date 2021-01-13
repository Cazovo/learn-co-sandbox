require 'sinatra'
class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV["SESSION_SECRET"]
  end
  
  
  get '/' do
    erb :'welcome'
  end
  
  get '/signup' do
    erb :'user/signup'
  end
  
  
  
  get '/login' do
    erb :'user/login'
  end
  
  post '/signup' do
    newUser = User.create(email: params[:email],
    password: params[:password],
    first_name: params[:first_name],
    last_name: params[:last_name],
    street_name: params[:street_name],
    city: params[:city],
    zip_code: params[:zip_code],
    number: params[:number],
    birth_date: params[:birth_date],
    salary: params[:gender],
    occupation: params[:occupation])
  
    #insert that model into your table
    #redirect to user page with user token/model info
    puts newUser.id
    session[:user_id] = newUser.id
        redirect '/accounts/show_all_accounts'
    if newUser == null 
        redirect '/user/signup'
    end
  end
  
   post '/login' do
      user = User.find_by(email: params[:username])
      if user && user.password = params[:password]
          session[:user_id] = user.id
          redirect '/accounts/show_all_accounts'
      else 
          redirect '/user/signup'
      end
   end
    
    get '/logout' do
      session.destroy
      redirect '/'
    end
    
    helpers do 
      def logged_in?
        !!session[:user_id]
      end
      
      def current_user
        @user ||= User.find_by(id: session[:user_id]) if logged_in?
      end
    end
end  