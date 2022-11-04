class SpdmUsersController < ApplicationController
  before_action :set_spdm_user, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /spdm_users or /spdm_users.json
  def index
    @spdm_users = SpdmUser.all
  end

  # GET /spdm_users/1 or /spdm_users/1.json
  def show
  end

  # GET /spdm_users/new
  def new
    #@spdm_user = SpdmUser.new
    @spdm_user = current_user.spdm_users.build
  end

  # GET /spdm_users/1/edit
  def edit
  end

  # POST /spdm_users or /spdm_users.json
  def create
    #@spdm_user = SpdmUser.new(spdm_user_params)
    @spdm_user = current_user.spdm_users.build(spdm_user_params)

    respond_to do |format|
      if @spdm_user.save
        format.html { redirect_to spdm_user_url(@spdm_user), notice: "Spdm user was successfully created." }
        format.json { render :show, status: :created, location: @spdm_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spdm_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spdm_users/1 or /spdm_users/1.json
  def update
    respond_to do |format|
      if @spdm_user.update(spdm_user_params)
        format.html { redirect_to spdm_user_url(@spdm_user), notice: "Spdm user was successfully updated." }
        format.json { render :show, status: :ok, location: @spdm_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spdm_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spdm_users/1 or /spdm_users/1.json
  def destroy
    @spdm_user.destroy

    respond_to do |format|
      format.html { redirect_to spdm_users_url, notice: "Spdm user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @spdm_user = current_user.spdm_users.find_by(id: params[:id])
    redirect_to spdm_users_path, notice: "Not Authorized to edit this register" if @spdm_user.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spdm_user
      @spdm_user = SpdmUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spdm_user_params
      params.require(:spdm_user).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end
