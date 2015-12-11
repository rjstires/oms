class EventSlotsController < ApplicationController
  before_action :set_event_slot, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  before_action :set_team

  # GET /event_slots/new
  def new
    @page_title = 'Create Slot';
    @event_slot = @event.event_slots.new
    render 'load_modal'
  end

  def show
  end

  # GET /event_slots/1/edit
  def edit
    @page_title = 'Edit Slot';
    render 'load_modal'
  end

  # POST /event_slots
  # POST /event_slots.json
  def create
    @event_slot = @event.event_slots.new(event_slot_params)

    respond_to do |format|
      if @event_slot.save
        format.js { render :refresh, status: :created, location: [@team, @event, @event_slot] }
      else
        format.js { render json: @event_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_slots/1
  # PATCH/PUT /event_slots/1.json
  def update
    respond_to do |format|
      if @event_slot.update(event_slot_params)
        format.js { render :refresh, status: :ok, location: [@team, @event, @event_slot] }
      else
        format.js { render json: @event_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_slots/1
  # DELETE /event_slots/1.json
  def destroy
    @event_slot.destroy
    respond_to do |format|
      format.js { render :destroy }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:team_id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_event_slot
      @event_slot = EventSlot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_slot_params
      params.require(:event_slot).permit(:event_id, :title, :description, :character_id)
    end
  end
