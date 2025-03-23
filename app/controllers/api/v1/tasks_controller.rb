module Api
    module V1
        class TasksController < ApplicationController
            before_action :authenticate_user
        
            def index
              tasks = @current_user.tasks
              render json: tasks
            end
        
            def show
              task = @current_user.tasks.find_by(id: params[:id])
              if task
                render json: task
              else
                render json: { error: "Task not found" }, status: :not_found
              end
            end
        
            def create
              task = @current_user.tasks.new(task_params)
              if task.save
                render json: task, status: :created
              else
                render json: { errors: task.errors.full_messages }, status: :unprocessable_entity
              end
            end
        
            def update
              task = @current_user.tasks.find_by(id: params[:id])
              if task&.update(task_params)
                render json: task
              else
                render json: { errors: task&.errors&.full_messages || ["Task not found"] }, status: :unprocessable_entity
              end
            end
        
            def destroy
              task = @current_user.tasks.find_by(id: params[:id])
              if task
                task.destroy
                render json: { message: "Task deleted successfully" }, status: :ok
              else
                render json: { error: "Task not found" }, status: :not_found
              end
            end
        
            private
        
            def authenticate_user
              token = request.headers["Authorization"]
              @current_user = User.find_by(auth_token: token)
            
              render json: { error: "Unauthorized" }, status: :unauthorized unless @current_user
            end
        
            def task_params
              params.permit(:title, :description, :status, :category_id)
            end
        end
    end
end