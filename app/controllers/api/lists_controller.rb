class Api::ListsController < Api::ApiController

   before_action :authenticated?

   def index
   end

   def create
     list = @current_user.lists.new(list_params)
     if list.save
       render json: list
     else
       render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
     end
   end

   def destroy
     begin
       list = List.find(params[:id])
       list.destroy
       render json: {}, status: :no_content
     rescue ActiveRecord::RecordNotFound
       render :json => {}, :status => :not_found
     end
   end



   private

   def list_params
     params.require(:list).permit(:title)
   end

 end
