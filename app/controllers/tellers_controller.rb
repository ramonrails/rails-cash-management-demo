class TellersController < ApplicationController
  before_action :set_teller, only: [:show, :edit, :update, :destroy]

  # GET /tellers
  # GET /tellers.json
  def index
    @tellers = current_user.tellers
  end

  # GET /tellers/1
  # GET /tellers/1.json
  def show
  end

  # GET /tellers/new
  def new
    @teller = Teller.new
  end

  # GET /tellers/1/edit
  def edit
  end

  # POST /tellers
  # POST /tellers.json
  def create
    @teller = Teller.new(teller_params)

    respond_to do |format|
      if @teller.save
        format.html { redirect_to @teller, notice: 'Teller was successfully created.' }
        format.json { render :show, status: :created, location: @teller }
      else
        format.html { render :new }
        format.json { render json: @teller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tellers/1
  # PATCH/PUT /tellers/1.json
  def update
    respond_to do |format|
      if @teller.update(teller_params)
        format.html { redirect_to @teller, notice: 'Teller was successfully updated.' }
        format.json { render :show, status: :ok, location: @teller }
      else
        format.html { render :edit }
        format.json { render json: @teller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tellers/1
  # DELETE /tellers/1.json
  def destroy
    @teller.destroy
    respond_to do |format|
      format.html { redirect_to tellers_url, notice: 'Teller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teller
      @teller = Teller.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def teller_params
      params.require(:teller).permit(:date, :opening, :cash_in, :cash_out, :user_id, :company_id, :country_id, :year, :month)
    end
end
