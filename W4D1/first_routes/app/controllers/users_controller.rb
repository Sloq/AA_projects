class UsersController < ApplicationController
  def index
    @user = User.all
    render json: @user
  end

  def create
    p params
    @user = User.new(user_params)
    if @user.save!
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end

#
# name_of_hash[pizza] => 'cheese'
# name_of_hash[pizza][cheese] => 'mozarella'
# something_else[ice_cream] => 'strawberry!'
