class ShrinksController < ApplicationController
  def create
    object = Shrink.create!(allowed_params)
    render json: {
      status: true,
      data: object.shortend_url,
      message: 'Url Shortend..!'
    }
  end

  private

  def allowed_params
    params.permit(:name, :url)
  end
end
