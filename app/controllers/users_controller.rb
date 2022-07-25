class UsersController < ApplicationController
  def index
    render json: { message: "success" }, status: :ok
  end
end
