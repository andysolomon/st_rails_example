class ShtController < ApplicationController
  def index
    page = params[:page] || 1
    @products = Product.order(:created_at).page(page)

    respond_to do |format|
      format.html
      format.json do
        render json: @products.map { |p| view_context.product_template_data(p) }
      end
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
