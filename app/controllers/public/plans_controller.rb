class Public::PlansController < ApplicationController
  #非ログイン時に、新規投稿・詳細ページ・編集ページのURLを入力するとログインページにリダイレクト（デフォルトでログインページ）
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update]
  #ログインユーザー以外の投稿編集画面のURLを入力する→投稿一覧へリダイレクトするように
  #private ensure_correct_user定義記述
  before_action :ensure_correct_user, only: [:edit, :update]
  before_action :set_plan, only: %i[ show edit update destroy ]

  # GET /plans or /plans.json
  def index
    @plans = Plan.all.order(created_at: :desc)
  end

  # GET /plans/1 or /plans/1.json
  def show
    @plan = Plan.find(params[:id])
    @comment = Comment.new
    #@spots = @plan.spots
  end

  # GET /plans/new
  def new
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans or /plans.json
  def create
    @plan = current_user.plans.build(plan_params)
    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, notice: t("plans.create.Plan_was_successfully_created") }
        format.json { render :show, status: :created, location: @plan }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    respond_to do |format|
      if @plan.update(plan_params)
        format.html { redirect_to @plan, notice: t("plans.update.Plan_was_successfully_updated") }
        format.json { render :show, status: :ok, location: @plan }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1 or /plans/1.json
  def destroy
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to mypage_path, notice: t("plans.destroy.Plan_was_successfully_destroyed") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # planパラメータ
    def plan_params
      params.require(:plan).permit(:user_id, :title, :review, :start_date, :end_date, :body,
        spots_attributes: [:id, :name, :latitude, :address, :longitude, :visit_order, :staying_start, :staying_end, :explanation, :_destroy, {images: []},
          routes_attributes: [:id, :departure, :arrival, :travel_time, :transportation, :description, :visit_order, :_destroy
          ]
        ])
    end

    #ログインユーザー以外の投稿編集画面のURLを入力する→投稿一覧へリダイレクトするように
    #before_action :ensure_correct_user, only: [:edit, :update]定義
    def ensure_correct_user
      @plan = Plan.find(params[:id])
      unless @plan.user == current_user
        redirect_to plans_path
      end
    end

end
