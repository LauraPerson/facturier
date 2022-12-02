class ClientsController < ApplicationController
  def index
    @clients = Client.all.where(user_id: current_user)
  end

  def show 
    @client = Client.find(params[:id])
  end


  def new
    @client = Client.new
  end 

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    @client.save!
    flash.alert = "New client added"

    redirect_to client_path(@client)
  end

  def edit
    @client = Client.find(params[:id])

  end

  def update
    # @client = Client.find(params[:id])
    # if @client.update(client_params.reject { |k| k["photos"] })
    #   if client_params[:photos].present?
    #     client_params[:photos].each do |photo|
    #       @client.photos.attach(photo)
    #     end
    #   end
    #   flash.alert = "Projet Modifié"
    #   redirect_to articles_path(@client)
    # else
    #   flash.alert = "Projet non modifié"
    #   redirect_to articles_path
    # end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    flash.alert = "Client deleted"
    redirect_to clients_path
  end

  private 

  def client_params 
    params.require(:client).permit(:name, :address)
  end 

end
