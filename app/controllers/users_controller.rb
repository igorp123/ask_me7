class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
    else
      flash.now[:alert] = 'Вы неправильно заполнили поля формы регистрации'

      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_path, notice: 'Данные пользователя обновлены'
    else
      flash.now[:alert] = 'При попытке сохранить данные пользователя произошли ошибки'

      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete

    session.delete(:user_id)

    redirect_to root_path, notice: 'Пользователь удален'
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :nickname, :email,:password, :password_confirmation
    )
  end
end
