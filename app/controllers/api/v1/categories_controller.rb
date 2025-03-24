module Api
    module V1        
        class CategoriesController < ApplicationController
            before_action :authenticate_user, only: [:create]
        
            def index
              categories = Category.all
              render json: categories
            end
        
            def create
              category = Category.new(category_params)
              if category.save
                render json: category, status: :created
              else
                render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
              end
            end
        
            private
        
            def category_params
              params.permit(:name)
            end
        
            def authenticate_user
              token = request.headers["Authorization"]
              return render json: { error: "Missing token" }, status: :unauthorized if token.blank?
              @current_user = User.find_by(auth_token: token)
            
              render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
            end
        end
    end
end