class SleepCyclesController < ApplicationController
  before_action :set_sleep_cycle, only: [:show, :update, :destroy]

  # GET /sleep_cycles
  def index
    @sleep_cycles = SleepCycle.all

    render json: @sleep_cycles
  end

  # GET /sleep_cycles/1
  def show
    render json: @sleep_cycle
  end

  # POST /sleep_cycles
  def create
    @sleep_cycle = SleepCycle.new(sleep_cycle_params)

    if @sleep_cycle.save
      render json: @sleep_cycle, status: :created, location: @sleep_cycle
    else
      render json: @sleep_cycle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sleep_cycles/1
  def update
    if @sleep_cycle.update(sleep_cycle_params)
      render json: @sleep_cycle
    else
      render json: @sleep_cycle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sleep_cycles/1
  def destroy
    @sleep_cycle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sleep_cycle
      @sleep_cycle = SleepCycle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def sleep_cycle_params
      params.require(:sleep_cycle).permit(:user_id, :start_sleep_time, :end_sleep_time, :total_sleep_time)
    end
end
