class Public::SearchesController < ApplicationController
  before_action :authenticate_user! #ログインしているユーザの場合
  
  def search
    @range = params[:range]

    if @range == "User" #looksメソッドはモデルで定義
      @users = User.looks(params[:search], params[:word]) #@usersにUserモデル内での検索結果代入
    else #@rangeがUserでなかった場合
      @plans = Plan.looks(params[:search], params[:word]) #@plansにPlanモデル内での検索結果代入
    end

    render 'searches/search_result'
    #検索結果search_resultビューファイル表示

  end
  
end
