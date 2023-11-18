# app/controllers/client_controller.rb

def create
    @client = Client.create!(params[:client])
    render json: @client
  end