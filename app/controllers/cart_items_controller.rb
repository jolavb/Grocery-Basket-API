class CartItemsController < ProtectedController
  before_action :set_cart_item, only: [:show, :update, :destroy]

  # GET /cart_items
  def index
    @cart_items = current_user.items.all
    render json: @cart_items
  end

  # GET /cart_items/1
  def show
    render json: @cart_item
  end

  # POST /cart_items
  def create
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      render json: current_user.items.all, status: :created, location: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cart_items/1
  def update
    if @cart_item.update(cart_item_params)
      render json: @cart_item
    else
      render json: @cart_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cart_items/1
  def destroy
    @cart_item.destroy
    render json: current_user.items.all
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cart_item
    @cart_item = current_user.cart_items.find_by(item_id: params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cart_item_params
    params.require(:cart_item).permit(:user_id, :item_id)
  end
end
