class ItemsController < ApplicationController
  def index
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to root_path
  end

  def new
    @item = Item.new
    @item.disk_numbers.build
    @item.tracks.build
    @item.labers.build
    @item.genres.build
    @item.artists.build
  end

  def edit
  end

  def show
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:item_introduction,:title,:image,:stock,:price_without_tax,:content_type)
    params.require(:item).permit(disk_numbers_attributes: [:number,published_at])
    params.require(:item).permit(labers_attributes:[:name.published_at])
    params.require(:item).permit(genres_attributes:[:name.published_at])
    params.require(:item).permit(tracks_attriburtes:[:number.published_at])
  end

end
