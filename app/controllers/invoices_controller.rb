class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.where(user_id: current_user)
  end

  def show 
    @invoice = Invoice.find(params[:id])
    @selected_client = SelectedClient.find_by(invoice_id: @invoice)
  end


  def new
    @number_of_invoices = Invoice.all.where(user_id: current_user).length
    @invoice = Invoice.new
    @clients = Client.all.where(user_id: current_user)
  end 

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    @client = Client.find(params[:invoice][:client])

    @selected_client = SelectedClient.new
    @selected_client.client = @client
    @selected_client.invoice = @invoice
    @selected_client.save!

    @invoice.selected_client = @selected_client


    @invoice.save!

    flash.alert = "New invoice added"

    redirect_to invoice_path(@invoice)
  end

  def edit
    @invoice = Invoice.find(params[:id])

  end


  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    flash.alert = "Invoice deleted"
    redirect_to invoices_path
  end

  private 

  def invoice_params 
    params.require(:invoice).permit(:object, :date)
  end 

end
