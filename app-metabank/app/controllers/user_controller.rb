'sinatra'
class UserController < ApplicationController

    get '/create_user' do
        erb :'user/create_user'
    end
    
    post '/create_user' do
        user = User.create(name: params[:name],
        email: params[:email],
        password: params[:password],
        first_name: params[:first_name],
        last_name: params[:last_name],
        street_name: params[:street_name],
        city: params[:city],
        zip_code: params[:zip_code],
        phone: params[:phone],
        birth_date: params[:birth_date],
        gender: params[:gender],
        salary: params[:salary],
        occupation: params[:occupation])   
       
        if user.valid?
            session[:user_id] = user.id
            redirect '/account/:user_id'
        else 
            redirect '/create_user'
        end
    end
end 