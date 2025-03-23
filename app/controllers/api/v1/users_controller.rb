module Api
  module V1
    class UsersController < ApplicationController
      def signup
        user = User.new(user_params)
        if user.save
          render json: { message:"signup succesfull",user_id: user.id, auth_token: user.auth_token }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def login
        user = User.find_by(email: params[:email].downcase)
        if user&.authenticate(params[:password])
          render json: { message:"login done" , user_id: user.id, auth_token: user.auth_token }, status: :ok
        else
          render json: { error: "Invalid email or password" }, status: :unauthorized
        end
      end
    
      private
    
      def user_params
        params.permit(:email, :password)
      end
    end    
  end
end
