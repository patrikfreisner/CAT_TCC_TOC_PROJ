class NotationsController < ApplicationController
  before_action :set_notation, only: [:show, :update, :destroy]

  # GET /notations
  def index
    @notations = Notation.all

    render json: @notations
  end

  # GET /notations/1
  def show
    render json: @notation
  end

    # GET /notations/1
  def findByNotationCode
    @notation = Notation.where(bpm_notation_code: params[:bpm_notation_code])
    print @notation.any?
    if @notation.any?
      render json: @notation
    else
      render :status => 404
    end
  end

  # POST /notations
  def create
    @notation = Notation.new(notation_params)
    
    if params[:related_notation] != nil
      @notationsArray = []
      params[:related_notation].each do |notation_id| 
        @notationsArray.push(Notation.find(notation_id[:id]))
      end 
      @notation.related_notation = @notationsArray
    end
    
    if @notation.save
      render json: @notation, status: :created, location: @notation
    else
      render json: @notation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /notations/1
  def update

    if params[:related_notation] != nil
      @notationsArray = []
      params[:related_notation].each do |notation_id| 
        @notationsArray.push(Notation.find(notation_id[:id]))
      end 
      @notation.related_notation = @notationsArray
    end
    if @notation.update(notation_params)
      render json: @notation
    else
      render json: @notation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /notations/1
  def destroy
    @notation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notation
      @notation = Notation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def notation_params
      params.require(:notation).permit(
        :name, 
        :resource, 
        :compound_id, 
        :can_handle_id, 
        :can_produce_id, 
        :can_handle, 
        :can_produce, 
        :is_constraint, 
        :bpm_notation_code, 
        :diagram_id , 
        :related_notation, 
        :related_notation_id,
        :can_handle_attributes => [:id, :quantity, :time], 
        :can_produce_attributes => [:id, :quantity, :time], 
        :compound_attributes => [:id, :name])
    end
end
