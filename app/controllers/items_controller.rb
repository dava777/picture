class ItemsController < ApplicationController

  # before_filter :find_item, only: [:show, :edit, :update, :destroy, :upvote]
  # before_filter :check_if_admin, only: [:edit, :update, :destroy]

  def index
    @items = Item.all
  end

  # /items/id GET
  def show
    unless @item = Item.where(id: params[:id]).first
      render text: 'Page not found', status: 404
    end
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/id/edit GET
  def edit
    @item  =Item.find(params[:id])
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'new'
    end
  end

  # /items/id  PUT
  def update
    @item = Item.find_by(id: params[:id])
    @item.update(item_params)
    if @item.errors.empty?
      redirect_to item_path(@item)
    else
      render 'edit'
    end
  end

  # /items/id DELETE
  def destroy
    begin
      @item.destroy
      redirect_to items_path
    rescue
      redirect_to items_path
    end
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to items_path
  end

  private
    def find_item
      @item = Item.where(id: params[:id]).first
      render_404 unless @item
    end

    def item_params
      params.require(:item).permit(:name, :real, :weight, :description, :price, :avatar)
    end



end
