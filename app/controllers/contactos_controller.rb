class ContactosController < ApplicationController
  before_filter :authenticate_user!
  
  before_action :set_contacto, only: [:show, :edit, :update, :destroy]

  before_filter :check_user, only: [:show, :edit, :update, :destroy]

  # GET /contactos
  # GET /contactos.json
  def index
    @contactos = Contacto.all
  end

  # GET /contactos/1
  # GET /contactos/1.json
  def show
  end

  # GET /contactos/new
  def new
    @contacto = Contacto.new
    @tipos = Tipo.all
    @contacto.telefonos.build
  end

  # GET /contactos/1/edit
  def edit
    @tipos = Tipo.all
    @contacto.telefonos.build
  end

  # POST /contactos
  # POST /contactos.json
  def create
    @contacto = Contacto.new(contacto_params)
    @contacto.user = current_user
    @tipos = Tipo.all

    respond_to do |format|
      if @contacto.save
        format.html { redirect_to @contacto, notice: 'Se ha creado el contacto correctamente.' }
        format.json { render :show, status: :created, location: @contacto }
      else
        format.html { render :new }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contactos/1
  # PATCH/PUT /contactos/1.json
  def update
    respond_to do |format|
      if @contacto.update(contacto_params)
        format.html { redirect_to @contacto, notice: 'Se ha actualizado el contacto correctamente.' }
        format.json { render :show, status: :ok, location: @contacto }
      else
        format.html { render :edit }
        format.json { render json: @contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contactos/1
  # DELETE /contactos/1.json
  def destroy
    @contacto.destroy
    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Se ha eliminado el contacto correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contacto
      @contacto = Contacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contacto_params
      params.require(:contacto).permit(:nombre, :apellidos, :email, :foto, :user_id, :tipo_id, :remove_foto, telefonos_attributes: [ :id, :numero ])
    end

    def check_user
      redirect_to current_user, alert: "Prohibido acceso a contactos de otro usuario!" if current_user.contactos.exclude?(@contacto)
    end

end
