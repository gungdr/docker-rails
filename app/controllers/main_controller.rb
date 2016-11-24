class MainController < ApplicationController
  def index
  	@inquiries = Inquiry.select("inquiries.*, categories.color")
                        .joins("inner join categories on categories.name = category ")
                        .order(created_at: :desc)
                        .paginate(:page => params[:page], :per_page =>5)

    @categories = Category.all.collect do |c|
      c.name
    end
    # @inquiry_grouped = Inquiry.group(:category).count
    @total_value = Inquiry.all.sum(:value).round(2)
    @total_account = Account.all.sum(:value).round(2)

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
	  	inquiry.save!
	  	flash[:notice] = "#{inquiry.name} has been created "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end

  def delete
  	begin
  		inquiry = Inquiry.find_by id: params[:id]
  		inquiry.delete!
  		flash[:notice] = "#{inquiry.name} has been deleted "
  	rescue Exception => e
  		flash[:error] = e.message
  	end
  	redirect_to action: "index"
  end


end
