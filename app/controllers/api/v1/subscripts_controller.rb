class Api::V1::SubscriptsController < ApplicationController
  def index
    @subscripts = Subscript.all
    render json: @subscripts
  end
end
