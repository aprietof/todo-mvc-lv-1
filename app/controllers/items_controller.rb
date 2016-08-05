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

  def update
    set_item
    @item.update(item_params)
    redirect_to list_path(@item.list)
  end

  def destroy
    set_item
    @item.destroy
    redirect_to list_path(@item.list)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:description, :status)
  end
end
