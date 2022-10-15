class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # データの受け取り、新規作成するためのインスタンスの作成
    @list = List.new(list_params)
    # データの受け取りを保存するためのsaveメソッド
    if @list.save
     redirect_to list_path(@list.id) # トップ画面に移動
    else
     render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
