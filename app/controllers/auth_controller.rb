class AuthController < ApplicationController
    def login 
        user = User.find_by(user_name: [params[:user_name]])
        if user && user.authenticate(params[:password])
            render json: user
        else 
            render json: {errors: 'wrong name or password'}
        end 
    end 
    
end