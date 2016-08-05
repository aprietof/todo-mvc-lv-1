class ItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.items.build(item_params)
    if @item.save
      redirect_to @list
    else
      render 'lists/show'
    end
  end

  private

  def set_item
    @item = Item.find(:id)
  end

  def item_params
    params.require(:item).permit(:description)
  end
end
