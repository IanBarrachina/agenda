class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_user, only: [:show, :find, :edit, :update, :destroy]
  before_filter :check_user, only: [:show, :find, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @contactos = @user.contactos.paginate(page: params[:page], :per_page => 10)
  end

  def find
    @contactos = @user.contactos.where("lower(nombre) LIKE ? OR lower(apellidos) LIKE ?", "%#{params[:nombre].downcase}%", "%#{params[:nombre].downcase}%").paginate(page: params[:page], :per_page => 10)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Se ha creado el usuario correctamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Se ha actualizado el usuario correctamente.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Se ha eliminado el usuario correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.fetch(:user, {})
    end


    def check_user
      redirect_to current_user, alert: "Prohibido acceso a otro usuario!" if current_user != User.find(params[:id])
    end
end
