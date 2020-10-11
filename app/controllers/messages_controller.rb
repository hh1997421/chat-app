class MessagesController < ApplicationController
  def index
    # @messageには、Message.newで生成した、Messageモデルのインスタンス情報を代入
    @message = Message.new
    # roomには、Room.find(params[:room_id])と記述することで、paramsに含まれているroom_idを代入
    @room = Room.find(params[:room_id])
  end


  # messagesコントローラーにcreateアクションを定義します。
  # @room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、message_paramsを引数にして、privateメソッドを呼び出します。
  # その値を@messageに代入し、saveメソッドでメッセージの内容をmessagesテーブルに保存します。
  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # メッセージを保存できた場合とできなかった場合で条件分岐ifの処理
    if @message.save
    # room_messages_path(@room)（参加しているチャットルームに投稿したメッセージの一覧画面）にリダイレクト
      redirect_to room_messages_path(@room)
    else
    # 失敗した場合、indexアクションが実行され、同じページに戻る
      render :index
    end
  end

  private

  # privateメソッドとしてmessage_paramsを定義し、メッセージの内容(content)をmessagesテーブルへ保存できるようにします。
  # パラメーターの中に、ログインしているユーザーのidと紐付いている、メッセージの内容(content)を受け取れるように許可します。
  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
  end
end
