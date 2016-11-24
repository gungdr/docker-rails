class AccountController < ApplicationController
  protect_from_forgery with: :exception
  def index
  	@accounts = Account.all
  end

  def new
  	begin
  		account = Account.new do |c|
  			c.name = params[:account][:name]
  			c.value = params[:account][:value]
  		end
  		account.save
  		flash[:notice] = "#{account.name} has been created "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end

  def delete
  	begin
  		account = Account.find_by id: params[:id]
  		account.delete
  		flash[:notice] = "#{account.name} has been deleted "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end
end
