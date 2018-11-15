class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :ensure_item_user, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :destroy]
  before_action :set_desc_images, only: [:show, :edit]

  def index
    @item_woman = Item.where(category_id: 1).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    @item_mens = Item.where(category_id: 2).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    @item_kids = Item.where(category_id: 3).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    @item_cosmetics = Item.where(category_id: 4).where.not(brand: ["シャネル", "ルイヴィトン", "シュプリーム", "ナイキ"] ).order("created_at DESC").limit(4)
    @item_chanels = Item.where(brand: "シャネル").order("created_at DESC").limit(4)
    @item_vuttons = Item.where(brand: "ルイヴィトン").order("created_at DESC").limit(4)
    @item_supremes = Item.where(brand: "シュプリーム").order("created_at DESC").limit(4)
    @item_nikes = Item.where(brand: "ナイキ").order("created_at DESC").limit(4)
  end

  def new
    @item = Item.new
    @item.images.build
    @category_large = Category.all
    @category_medium = Mitem.all
    @category_small = Sitem.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to :root
    else
      redirect_to action: :new
    end
  end

  def show
    @user_items = Item.where(user_id: @item.id).order('created_at DESC').limit(6)
    @category_items = Item.where(category_id: @item.id).order('created_at DESC').limit(6)
    @brand_items = Item.where(brand: @item.brand).order('created_at DESC').limit(6)
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to sell_path
  end

  def buy
  end

  private
  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_desc_images
    @images = @item.images.order('created_at DESC')
  end

  def ensure_item_user
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to :root
    end
  end

  def item_params
    params.require(:item).permit(
      :name,
      :content,
      :price,
      :condition,
      :size,
      :category_id,
      :mitem_id,
      :sitem_id,
      :brand,
      :burden,
      :shipping_method,
      :from_prefecture,
      :shipping_days,
      images_attributes: [:id, :image_url]
      ).merge(user_id: current_user.id)
  end

end
