class CategoryController < ApplicationController
	
	def index
		@categories = Category.all
	end

  def new
  	begin
  		category = Category.new do |c|
  			c.name = params[:category][:name]
  			c.color = params[:category][:color]
  		end
  		category.save
  		flash[:notice] = "#{category.name} has been created "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end

  def delete
  	begin
  		category = Category.find_by id: params[:id]
  		category.delete
  		flash[:notice] = "#{category.name} has been deleted "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end
end
