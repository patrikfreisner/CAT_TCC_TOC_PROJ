class CompoundsController < ApplicationController
  before_action :set_compound, only: [:show, :update, :destroy]

  # GET /compounds
  def index
    @compounds = Compound.all

    render json: @compounds
  end

  # GET /compounds/1
  def show
    render json: @compound
  end

  # POST /compounds
  def create
    @compound = Compound.new(compound_params)

    if @compound.save
      render json: @compound, status: :created, location: @compound
    else
      render json: @compound.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /compounds/1
  def update
    if @compound.update(compound_params)
      render json: @compound
    else
      render json: @compound.errors, status: :unprocessable_entity
    end
  end

  # DELETE /compounds/1
  def destroy
    @compound.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compound
      @compound = Compound.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def compound_params
      params.require(:compound).permit(:name)
    end
end
