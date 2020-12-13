class UsersController < ApplicationController
    def index 
        users = User.all 
        render json: users 
    end

    def show 
        user = User.find(params[:id])
        # bills = Bill.all.filter(bill.user_id == user.id)
        render json: user, except: [:created_at, :updated_at]
    end 

    def create 
        user = User.new(user_params)
        if user.save 
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
