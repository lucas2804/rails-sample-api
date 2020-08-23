class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def collect_name
    response = ::Users::CollectNameService.new.execute
    if response.error
      render json: { message: response.error }, status: :unprocessable_entity
    else
      render json: { names: response.result }
    end

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
