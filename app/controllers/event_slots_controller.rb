class EventSlotsController < ApplicationController
  before_action :set_event_slot, only: [:show, :edit, :update, :destroy]
  before_action :set_event
  before_action :set_team

  # GET /event_slots/new
  def new
    @event_slot = @event.event_slots.new

  end

  # GET /event_slots/1/edit
  def edit
  end

  # POST /event_slots
  # POST /event_slots.json
  def create
    @event_slot = @event.event_slots.new(event_slot_params)

    respond_to do |format|
      if @event_slot.save
        format.html { redirect_to team_events_url(@team), notice: 'Slot was successfully created.' }
        format.json { render :show, status: :created, location: @event_slot }
      else
        format.html { render :new }
        format.json { render json: @event_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_slots/1
  # PATCH/PUT /event_slots/1.json
  def update
    respond_to do |format|
      if @event_slot.update(event_slot_params)
        format.html { redirect_to team_events_url(@team), notice: 'Slot was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_slot }
      else
        format.html { render :edit }
        format.json { render json: @event_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_slots/1
  # DELETE /event_slots/1.json
  def destroy
    @event_slot.destroy
    respond_to do |format|
      format.html { redirect_to team_events_url(@team), notice: 'Slot was successfully destroyed.' }
      format.json { head :no_content }
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
