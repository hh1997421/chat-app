class UsersController < ApplicationController
  def edit
  end

  def update
    # current_user.updateに成功した場合、root（チャット画面）にリダイレクト
   if current_user.update(user_params)
    redirect_to root_path
   else
    # 失敗した場合、render :editとeditのアクションを指定しているため、editのビューが表示
    render :edit
   end
  end

  private
# ストロングパラメーターを使用し、user_paramsを定義
  def user_params
    # user_paramsの中でpermitメソッドを使用し、「name」と「email」の編集を許可
    params.require(:user).permit(:name, :email)
  end
end