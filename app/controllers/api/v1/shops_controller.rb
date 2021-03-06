class Api::V1::ShopsController < Api::V1::BaseController
  def index
    @shops = Shop.search(params)
    render json: @shops, include: [:shop_categories]
  end
end
