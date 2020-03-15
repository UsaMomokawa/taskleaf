# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.status = 0

    if @item.save
      redirect_to item_path(@item), notice: "#{@item.name}を買いたいモノに追加しました"
    else
      flash.now[:alert] = '入力項目に誤りがあります'
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to item_path(@item), notice: "#{@item.name}の情報を修正しました"
    else
      flash.now[:alert] = '入力項目に誤りがあります'
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to items_path, notice: "#{item.name}を削除しました"
  end

  private

  def item_params
    params.require(:item).permit(
      :name, :description, :priority, :status
    )
  end
end
