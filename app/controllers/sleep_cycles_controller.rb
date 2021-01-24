class SleepCyclesController < ApplicationController
  before_action :set_sleep_cycle, only: [:show, :update, :destroy, :end_sleep_cycle]

  # GET /sleep_cycles
  def index
    @sleep_cycles = SleepCycle.all.order_by_start_time

    render json: @sleep_cycles
  end

  # GET /sleep_cycles/1
  def show
    render json: @sleep_cycle
  end

  # POST /sleep_cycles
  def create
    @sleep_cycle = SleepCycle.new(sleep_cycle_params)
    @sleep_cycle.update(start_sleep_time: Time.now)

    if @sleep_cycle.save
      render json: @sleep_cycle, status: :created, location: @sleep_cycle
    else
      render json: @sleep_cycle.errors, status: :unprocessable_entity
    end
  end

  def start_sleep_cycle
    @sleep_cycle = SleepCycle.new(sleep_cycle_params)
    @sleep_cycle.update(start_sleep_time: Time.now)

    if @sleep_cycle.save
      render json: @sleep_cycle, status: :created, location: @sleep_cycle
    else
      render json: @sleep_cycle.errors, status: :unprocessable_entity
    end
  end

  def end_sleep_cycle
    @sleep_cycle.update_total_time
    if @sleep_cycle.save
      render json: @sleep_cycle, status: :ok, location: @sleep_cycle
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_sleep_cycle
    @sleep_cycle = SleepCycle.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def sleep_cycle_params
    params.permit(:user_id)
  end
end
