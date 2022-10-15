class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def crate
    # データの受け取り、新規作成するためのインスタンスの作成
    list = List.new(list_params)
    # データの受け取りを保存するためのsaveメソッド
    list.save
    # トップ画面に移動
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    
  end

  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
