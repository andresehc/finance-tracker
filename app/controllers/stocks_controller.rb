class StocksController < ApplicationController

  def search
  	if params[:stock].present?
	    @stock = Stock.new_from_lookup(params[:stock])
	    if @stock
	    	render 'users/my_portfolio'
	    else
	    	flash[:danger] = "You have entered an invalid stock ticker"
	    	redirect_to my_portfolio_path
	    end
	  else
	  	flash[:danger] = "You have to enter a ticker"
	  	redirect_to my_portfolio_path
	  end
  end
end