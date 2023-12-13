module Api
  class UsersController < ApiController
    def index
      users = User.where('email ILIKE ?', "%#{params[:email]}%")

      render json: { users: }
    end

    def create
      @user = User.new(user_params)

      if @user.valid? && @user.save
        render json: { user: @user }, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end
