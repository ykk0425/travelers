class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]

  # GET /plans or /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1 or /plans/1.json
  def show
    @plan = Plan.find(params[:id])
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
        format.html { redirect_to @plan, notice: "Plan was successfully created." }
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
        format.html { redirect_to @plan, notice: "Plan was successfully updated." }
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
      format.html { redirect_to plans_path, status: :see_other, notice: "Plan was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan
      @plan = Plan.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plan_params
      params.require(:plan).permit(:user_id, :title, :review, :start_date, :end_date, :body,
        spots_attributes: [:id, :name, :image, :latitude, :longitude, :visit_order, :staying_start, :staying_end, :explanation, :_destroy,
          routes_attributes: [:id, :departure, :arrival, :travel_time, :transportation, :description, :visit_order, :_destroy
          ]
        ])
    end
end
