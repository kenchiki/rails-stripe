class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # TODO:有料プランのrequireを追加する。それを必要な箇所でbefore_actionする。ユーザーが有料ユーザーじゃなければ有料課金処理に飛ばす
end
