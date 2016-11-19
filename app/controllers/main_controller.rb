class MainController < ApplicationController
  def index
  	@inquiries = Inquiry.all

    @total_value = 0

    @inquiries.each do |i|
      @total_value += i.value
    end

    @categories = Category.all.collect do |c|
      c.name
    end
  end

  def new
  	begin
	  	inquiry = Inquiry.new do |i|
	  		i.name = params[:inquiry][:name]
	  		i.value = params[:inquiry][:value]
	  		i.category =params[:inquiry][:category]
	  		i.trans_type = "DB"
	  		i.date = Time.now
	  	end
	  	inquiry.save	
	  	flash[:notice] = "#{inquiry.name} has been created "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end

  def delete
  	begin
  		inquiry = Inquiry.find_by id: params[:id]
  		inquiry.delete
  		flash[:notice] = "#{inquiry.name} has been deleted "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end


end
