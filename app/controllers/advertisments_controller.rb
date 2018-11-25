class AdvertismentsController < ApplicationController
  before_action :set_advertisment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:index, :show,:edit, :update, :destroy, :new]

  def index
    @advertisments = Advertisment.all
  end

  def show
  end

  def new
    @advertisment = Advertisment.new
  end

  def edit
  end

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

  def destroy
    @advertisment.destroy
    respond_to do |format|
      format.html { redirect_to advertisments_url, notice: 'Advertisment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_advertisment
      @advertisment = Advertisment.find(params[:id])
    end

    def advertisment_params
      params.require(:advertisment).permit(:title, :comany_name, :start_date, :end_date, :code_html, :code_css, :code_js)
    end
end
