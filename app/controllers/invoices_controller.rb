class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.where(user_id: current_user)
  end

  def show 
    @invoice = Invoice.find(params[:id])
    @selected_client = SelectedClient.find_by(invoice_id: @invoice)
    @items = Item.where(invoice_id: @invoice.id)

    respond_to do |format|
      format.html
      format.pdf do
        # Rails 6:
        # render template: "posts/show.html.erb",
        #        pdf: "Post ID: #{@post.id}"

        # Rails 7:
        # render pdf: "file_name", template: "invoices/show",

        render(
          pdf: 'document',
          formats: [:html],
          encoding: 'UTF-8',
          template: 'invoices/show',
          layout: 'pdf',
          margin: {
            top: 16, # default 10 (mm)
            bottom: 16
          }
        )
        

      end
    end
  end


  def new
    @number_of_invoices = Invoice.all.where(user_id: current_user).length
    @invoice = Invoice.new
    @item = Item.new
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

    redirect_to new_invoice_item_path(@invoice)
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
