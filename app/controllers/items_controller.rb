class ItemsController < ApplicationController

  def index 
    @invoice = Invoice.find(params[:invoice_id])
    @items = Item.all.where(invoice_id: params[:invoice_id])
  end

  def new
    @item = Item.new
    @invoice = Invoice.find(params[:invoice_id])
  end 

  def create 
    @invoice = Invoice.find(params[:invoice_id])
    @item = Item.new(items_params)
    @item.invoice = @invoice
    @item.save!
    flash.alert = "Item Ajouté"
    redirect_to invoice_items_path(@invoice)
  end 

  private 

  def items_params 
    params.require(:item).permit(:name, :quantity, :unit, :price)
  end 

end
