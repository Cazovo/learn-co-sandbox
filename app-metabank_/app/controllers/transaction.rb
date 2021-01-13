require 'sinatra'
class TransactionController < ApplicationController

   get '/transactions/:account_id' do 
      if logged_in?
         account = Account.find_by(id: params[:id])
         @transactions = account.transactions
      end
   end
end   