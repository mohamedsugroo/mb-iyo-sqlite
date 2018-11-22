class AdvertismentsController < ApplicationController
  before_action :set_advertisment, only: [:show, :edit, :update, :destroy]

  # GET /advertisments
  # GET /advertisments.json
  def index
    @advertisments = Advertisment.all
  end

  # GET /advertisments/1
  # GET /advertisments/1.json
  def show
  end

  # GET /advertisments/new
  def new
    @advertisment = Advertisment.new
  end

  # GET /advertisments/1/edit
  def edit
  end

  # POST /advertisments
  # POST /advertisments.json
  def create
    @advertisment = Advertisment.new(advertisment_params)

    respond_to do |format|
      if @advertisment.save
        format.html { redirect_to @advertisment, notice: 'Advertisment was successfully created.' }
        format.json { render :show, status: :created, location: @advertisment }
      else
        format.html { render :new }
        format.json { render json: @advertisment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisments/1
  # PATCH/PUT /advertisments/1.json
  def update
    respond_to do |format|
      if @advertisment.update(advertisment_params)
        format.html { redirect_to @advertisment, notice: 'Advertisment was successfully updated.' }
        format.json { render :show, status: :ok, location: @advertisment }
      else
        format.html { render :edit }
        format.json { render json: @advertisment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisments/1
  # DELETE /advertisments/1.json
  def destroy
    @advertisment.destroy
    respond_to do |format|
      format.html { redirect_to advertisments_url, notice: 'Advertisment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisment
      @advertisment = Advertisment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advertisment_params
      params.require(:advertisment).permit(:title, :comany_name, :start_date, :end_date, :code_html, :code_css, :code_js)
    end
end
