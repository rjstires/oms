class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :set_team

  # GET /events
  # GET /events.json
  def index
    @events = @team.events.upcoming_events
  end

  # GET /events/new
  def new
    @page_title = 'Create Event'
    @event = @team.events.new
    render 'load_modal'
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/1/edit
  def edit
    @page_title = 'Edit Event'
    render 'load_modal'
  end

  # POST /events
  # POST /events.json
  def create
    @event = @team.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.js { render :refresh, status: :created, location: [@team, @event] }
      else
        format.js { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.js { render :refresh, status: :created, location: [@team, @event] }
      else
        format.js { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
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
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:cutoff_timestamp, :event_timestamp, :category_id, :zone_id, :difficulty_id)
  end
end
