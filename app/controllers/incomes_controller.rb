class IncomesController < ApplicationController
    def index 
        incomes = Income.all 
        render json: incomes 
    end 

    def show 
        income = Income.find(params[:id])
        render json: income 
    end 

    def create 
        income = Income.new(income_params)
        if income.save 
            render json: income 
        else 
            render json: {income.errors.full_messages}
        end 
    end 

    def update 
        income = Income.find(params[:id])
        income.update(income_params)
    end 

    def destroy 
        income = Income.find(params[:id])
        income.destroy 
    end 

    private 
    def income_params
        params.require(:income).permit(:name, :amount, :date,:category, :user_id)
    end 
end
