class ShrinksController < ApplicationController
  def create
    object = Shrink.new(allowed_params)
    status, link = ShortenUrl.new.call(params[:url])
    object.shortend_url = link

    if status
      object.save!
      render json: {
        status: true,
        url: object.shortend_url,
        message: 'Url Shortend..!'
      }
    else
      render json: {
        status: false,
        message: 'Please provide a valid url..!'
      }
    end
  end

  private

  def allowed_params
    params.permit(:name, :url)
  end
end
