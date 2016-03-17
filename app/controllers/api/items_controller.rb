class Api::ItemsController < Api::ApiController

   before_action :authenticated?

   def index
   end

   def create
     list = List.find(params[:list_id])
     item = list.items.new(item_params)
     if item.save
       render json: item
     else
       render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
     end
   end



   private

   def item_params
     params.require(:item).permit(:body)
   end

end
