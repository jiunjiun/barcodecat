class Admin::ProductsController < AdminController
  expose :event, -> { Event.find(params[:event_id]) }
  expose :products, -> { event.products }
  expose :product

  def show; end

  def new; end

  def create
    product = event.products.build(product_params)
    if product.save
      redirect_to admin_event_path(params[:event_id], anchor: 'products'), notice: t('helpers.successfully_created')
    else
      render :new
    end
  end

  def edit; end

  def update
    if product.update product_params
      redirect_to admin_event_path(params[:event_id], anchor: 'products'), notice: t('helpers.successfully_updated')
    else
      render :edit
    end
  end

  def destroy
    if product.event.enable
      redirect_to admin_event_path(params[:event_id]), alert: t('helpers.destroy_fail')
    else
      product.destroy
      redirect_to admin_event_path(params[:event_id], anchor: 'products'), notice: t('helpers.successfully_destroy')
    end
  end

  def update_index
    result = { status: :fail }

    product_indexs = params[:product_index_attributes]
    result = { status: :success } if Product.update product_indexs.keys, product_indexs.values

    render json: result
  end

  private

  def product_params
    params.require(:product).permit(:name, :desc, :url, :banner, :event_id, :index)
  end
end
