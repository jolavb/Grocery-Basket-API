class RecipeItemsController < ApplicationController
  before_action :set_recipe_item, only: [:show, :update, :destroy]

  # GET /recipe_items
  def index
    @recipe_items = RecipeItem.all

    render json: @recipe_items
  end

  # GET /recipe_items/1
  def show
    render json: @recipe_item
  end

  # POST /recipe_items
  def create
    @recipe_item = RecipeItem.new(recipe_item_params)

    if @recipe_item.save
      render json: @recipe_item, status: :created, location: @recipe_item
    else
      render json: @recipe_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipe_items/1
  def update
    if @recipe_item.update(recipe_item_params)
      render json: @recipe_item
    else
      render json: @recipe_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipe_items/1
  def destroy
    @recipe_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_item
      @recipe_item = RecipeItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_item_params
      params.require(:recipe_item).permit(:item_id, :recipe_id)
    end
end
