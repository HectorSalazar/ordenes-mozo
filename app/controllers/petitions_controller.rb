class PetitionsController < ApplicationController
  before_action :set_petition, only: %i[ show edit update destroy ]
  before_action :set_combos, only: %i[ show new edit update destroy ]

  # GET /petitions or /petitions.json
  def index
    @petitions = Petition.all
  end

  # GET /petitions/1 or /petitions/1.json
  def show
  end

  # GET /petitions/new
  def new
    @petition = Petition.new
  end

  # GET /petitions/1/edit
  def edit
  end

  # POST /petitions or /petitions.json
  def create

    @petition = Petition.new(petition_params)

    respond_to do |format|
      if @petition.save
        # format.html { redirect_to petition_url(@petition), notice: "Petition was successfully created." }
        # format.json { render :show, status: :created, location: @petition }
        @diningtable = Diningtable.find_by position: (params[:position])
        @diningtable.update(state: 1)
        redirect_to controller: 'home', action: 'show', position: params[:position]
      else
        # format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /petitions/1 or /petitions/1.json
  def update
    respond_to do |format|
      if @petition.update(petition_params)
        format.html { redirect_to petition_url(@petition), notice: "Petition was successfully updated." }
        format.json { render :show, status: :ok, location: @petition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @petition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /petitions/1 or /petitions/1.json
  def destroy
    @petition.destroy

    respond_to do |format|
      format.html { redirect_to petitions_url, notice: "Petition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition
      @petition = Petition.find(params[:id])
    end

    def set_combos
      @diningtables = Diningtable.all
      @waiters = Waiter.all
      @plates = Plate.all
    end

    # Only allow a list of trusted parameters through.
    def petition_params
      # params.fetch(:petition, {})
      params.require(:petition).permit(:plate_id, :diningtable_id, :waiter_id)
    end
end
