class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def new
        @item = Item.new
        @list = params[:list_id]
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            flash[:info] = "Added Task: #{@item.name}"
        else
            flash[:error] = "ERROR"
        end 
        
        redirect_to list_path(@item.list)

    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])

        if @item.update(item_params)
            redirect_to item_path(@item)
        else
            render :edit
        end
    end

    def show
            @item = Item.find(params[:id])
    end

    def destroy
        @item_name = Item.find(params[:id]).name
        @item_list = Item.find(params[:id]).list_id

        if Item.delete(params[:id])
            flash[:info] = "Item Deleted: #{@item_name}"
        else
            flash[:error] = "ERROR DELETING: #{@item_name}"
        end

        redirect_to list_path(@item_list)
    end

    private

    def item_params
        params.require(:item).permit(:name, :list_id)
    end
end