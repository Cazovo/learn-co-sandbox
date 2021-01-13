#get accounts route based on userid
#get certain accounts based on user session and accountid
require 'sinatra'
require_relative './application_controller'
class AccountController < ApplicationController

    # first call you make which lists every account you have which you can then drill down 
    get '/accounts/show_account/:account_id' do
        if logged_in?
              accounts = current_user.accounts #returns a singleton list

             # pass the account information to the HTML page
             erb :'accounts/show_all_accounts' #change html so this account info displays right when the user signs in
        else redirect '/login'
        end
    end

    # call this route after you've made your account selection
    get '/accounts/show_all_accounts' do
        if logged_in?
            @accountList = current_user.accounts #returns a singleton list
            erb :'accounts/show_all_accounts' # return this account information after the user has made selection
        else redirect '/login'
        end
    end    
  
    post '/account/create_account' do
        if logged_in?
            account = Account.create(
            user_id: params[:user_id],
            name: params[:name],
            created: Time.now.to_i,
            type: params[:type])
            redirect '/accounts/:user_id'
        else 
            redirect '/login'
        end       
    end    

    post '/account/delete_account/:account_id' do
        if logged_in?
            Account.delete_by(account_id: params[:account_id])
        else
            redirect '/accounts'
        end
    end
end
