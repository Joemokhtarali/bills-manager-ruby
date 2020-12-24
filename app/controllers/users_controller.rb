class UsersController < ApplicationController
    def index 
        users = User.all 
        render json: users 
    end

    def get_total_income 
        total = 0 
        user = User.find(params[:id])
        incomes = Income.select{|income| income.user_id == user.id}
        incomes.map{|income| total += income.amount}
        total
    end

    def get_total_bills 
        total = 0 
        user = User.find(params[:id])
        bills = Bill.select{|bill| bill.user_id == user.id}
        bills.map{|bill| total += bill.amount}
        total
    end

    def show 
        user = User.find(params[:id])
        bills = Bill.select{|bill| bill.user_id == user.id}
        incomes = Income.select{|income| income.user_id == user.id}
        total_income = get_total_income
        total_bills = get_total_bills
        balance = total_income - total_bills
        render json: {id: user.id, user_name: user.user_name, bills: bills, incomes: incomes, total_income: total_income, total_bills: total_bills, balance: balance}
    end 

    def create  
        
        user = User.new(user_name: params[:user_name], password: params[:password])
        if user.save 
            # byebug
            render json: user
        else 
            render json: {errors: user.errors.full_messages}
        end 
    end 

    def edit 
        @user = User.find(params[:id])
    end 

    def update 
        user = User.find(params[:id])
        user.update(user_params)
        render json: user 
    end 

    def destroy
        user = User.find(params[:id])
        user.destroy
    end

    private 
    def user_params
        params.require(:user).permit(:user_name, :password)
    end

end
