class RoomsController < ApplicationController
  # rooms/index.html.erb作成のため
  def index
  end
  
  # チャットルームの新規作成なので「new」アクション
  def new
    # form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
    @room = Room.new
  end

  # ここでは、保存が成功したかどうかで処理を分岐しています。
  # 成功した場合はredirect_toメソッドでルートパスにリダイレクトし、
  # 失敗した場合はrenderメソッドでrooms/new.html.erbのページを表示
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    # どのチャットルームを削除するのかを特定する場合は、Room.find(params[:id])を使用して、削除したいチャットルームの情報を取得
    room = Room.find(params[:id])
    # destroyアクションは、削除するだけなのでビューの表示は必要はありません。そのため、インスタンス変数ではなく変数としてroomを定義し、destroyメソッドを使用します。
    room.destroy
    # destroyメソッドが実行されたら、root（roomsのindex）にリダイレクトする記述
    redirect_to root_path
  end


  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
