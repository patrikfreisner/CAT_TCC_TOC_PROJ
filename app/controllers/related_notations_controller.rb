class RelatedNotationsController < ApplicationController
  before_action :set_related_notation, only: [:show, :update, :destroy]

  # GET /related_notations
  def index
    @related_notations = RelatedNotation.all

    render json: @related_notations
  end

  # GET /related_notations/1
  def show
    render json: @related_notation
  end

  # POST /related_notations
  def create
    @related_notation = RelatedNotation.new(related_notation_params)

    if @related_notation.save
      render json: @related_notation, status: :created, location: @related_notation
    else
      render json: @related_notation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /related_notations/1
  def update
    if @related_notation.update(related_notation_params)
      render json: @related_notation
    else
      render json: @related_notation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /related_notations/1
  def destroy
    @related_notation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related_notation
      @related_notation = RelatedNotation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def related_notation_params
      params.require(:related_notation).permit(:notation_id, :related_notation_id)
    end
end
