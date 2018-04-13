class UserStocksController < ApplicationController
	def create
		stock= Stock.find_by_ticker(params[:stock_ticker]) #uso este hash pq se ve en el params al darle add al stock
		if stock.blank?
			stock= Stock.new_from_lookup(params[:stock_ticker])
			stock.save
		# else
		# 	flash.now[:danger]="Stock already in portfolio"
		# 	render 'users/my_portfolio'
		end
		@user_stock = UserStock.create(user: current_user, stock:stock)
		flash[:success] = "Stock #{@user_stock.stock.name} vas successfully added to your portfolio!"
		redirect_to my_portfolio_path
	end
end
