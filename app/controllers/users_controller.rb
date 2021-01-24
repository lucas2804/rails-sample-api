class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy friend_sleeps]

  def friend_sleeps
    friends = @user.friends
    result = @user.total_friend_sleeps_past_week
    data = []
    result.each do |obj|
      user = friends.select { |f| f.id == obj[0] }.first
      data << {
        id: user.id,
        email: user.email,
        total_sleep_last_week: (obj[1].to_f / 3600.to_f).round(2)
      }
    end
    render json: data
  end

  def collect_name
    response = ::Users::CollectNameService.new.execute
    if response.error
      render json: { message: response.error }, status: :unprocessable_entity
    else
      render json: { names: response.result }
    end

  end

  def healthz
    render json: { message: "System is Healthy" }, status: :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
