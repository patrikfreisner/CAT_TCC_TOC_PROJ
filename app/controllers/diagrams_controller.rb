class DiagramsController < ApplicationController
  before_action :set_diagram, only: [:show, :update, :destroy]

  # GET /diagrams
  def index
    @diagrams = Diagram.all

    render json: @diagrams
  end

  # GET /diagrams/1
  def show
    render json: @diagram
  end

  # POST /diagrams
  def create
    @diagram = Diagram.new(diagram_params)

    if @diagram.save
      render json: @diagram, status: :created, location: @diagram
    else
      render json: @diagram.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /diagrams/1
  def update
    if @diagram.update(diagram_params)
      render json: @diagram
    else
      render json: @diagram.errors, status: :unprocessable_entity
    end
  end

  # DELETE /diagrams/1
  def destroy
    @diagram.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diagram
      @diagram = Diagram.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diagram_params
      params.require(:diagram).permit(:name, :bpm_diagram_code, :constraint_limit)
    end
end
