class Api::V1::SubscriptsController < ApplicationController
  def index
    @subscripts = Subscript.all
    render json: @subscripts
  end

  def create
    @subscript = Subscript.new(subscript_params)
    if @subscript.save
      render json: @subscript, status: :created
    end
  end

  private

  def subscript_params
    params.require(:subscript).permit(:name, :email, :description, :phone, :language, :schooling)
  end
end
