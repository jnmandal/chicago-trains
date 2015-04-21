class TrainsController < ApplicationController
  before_action :set_train, only: [:show, :edit, :update, :destroy]

  def index
    @trains = Train.order :run
    respond_to do |format|
      format.html
      format.csv { send_data @trains.to_csv }
    end
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)
    respond_to do |format|
      if @train.save
        format.html { redirect_to @train, notice: 'Train was successfully created.' }
        format.json { render :show, status: :created, location: @train }
      else
        format.html { render :new }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @train.update(train_params)
        format.html { redirect_to @train, notice: 'Train was successfully updated.' }
        format.json { render :show, status: :ok, location: @train }
      else
        format.html { render :edit }
        format.json { render json: @train.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @train.destroy
    respond_to do |format|
      format.html { redirect_to trains_url, notice: 'Train was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    Train.import(params[:file])
    redirect_to root_url
  end

  private
    def set_train
      @train = Train.find(params[:id])
    end

    def train_params
      params.require(:train).permit(:line, :route, :run, :operator, :flag, :flag_info)
    end
end
