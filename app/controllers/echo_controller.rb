class EchoController < ApplicationController
  def show
    render json: { message: params[:message].to_s }
  end
end
