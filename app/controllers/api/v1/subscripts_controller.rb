class Api::V1::SubscriptsController < ApplicationController
  def index
    @subscripts = Subscript.all
    render json: @subscripts
  end

  def create
    SubscriptCreateJob.perform_later(subscript_params)
    
    render json: {message: 'Inscrição criada com sucesso!'}, status: :created
  end

  private

  def subscript_params
    params.require(:subscript).permit(:name, :email, :description, :phone, :language, :schooling)
  end
end
