class UsersController < ApiController
  before_action :set_user, only: %i[show update destroy]
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update  
    @education.update(first_name: params[:first_name], last_name: params[:last_name], gender: params[:gender], dob: params[:dob], address: params[:address ])
    render json: @education
  end

  def destroy
    @education.destroy
    render json: "sucessfully destroy"
  end

  def create  
    @user = User.create(first_name: params[:first_name], last_name: params[:last_name], gender: params[:gender], dob: params[:dob], address: params[:address ])
    render json: @user
  end

private
  def set_user
    @education = Education.find(params[:id])
  end
end
