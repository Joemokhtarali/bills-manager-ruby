class BillsController < ApplicationController
    def index 
        bills = Bill.all 
        render json: bills
    end 

    def show 
        bill = Bill.find(params[:id])
        render json: bill 
    end 


    def create 
        bill = Bill.new(bill_params)
        if bill.save
            render json: bill 
        else 
            render json: {errors: bill.errors.full_messages}
        end 

    end 

    def edit 
        bill = Bill.find(params[:id])
    end 

    def update 
        bill = Bill.find(params[:id])
        bill.update(bill_params)
    end 

    def destroy
        bill = Bill.find(params[:id])
        bill.destroy
    end 

    private
    def bill_params
        params.require(:bill).permit(:name, :amount, :category, :date, :user_id)
    end
end