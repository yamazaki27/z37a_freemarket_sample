class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @item_woman = Item.where(category_large_id: 1).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    # @item_mens = Item.where(category_large_id: 2).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    # @item_kids = Item.where(category_large_id: 3).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    # @item_cosmetics = Item.where(category_large_id: 4).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    @item_chanel = Item.where(brand: "シャネル").order("created_at DESC").limit(4)
    # @item_vutton = Item.where(brand: "ルイヴィトン").order("created_at DESC").limit(4)
    # @item_supreme = Item.where(brand: "シュプリーム").order("created_at DESC").limit(4)
    # @item_nike = Item.where(brand: "ナイキ").order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
    @item.images.build
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root
    else
      redirect_to action: :new
    end
  end

  def buy
  end

  private
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(
      :name,
      :content,
      :price,
      :condition,
      :size,
      :category_large_id,
      :category_medium_id,
      :category_small_id,
      :brand,
      :burden,
      :shipping_method,
      :from_prefecture,
      :shipping_days,
      images_attributes: [:id, :image_url]
      ).merge(user_id: current_user.id)
  end

end
