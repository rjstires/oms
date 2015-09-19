class Admin::SlotsController < AdminController
  before_action :set_slot, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:new, :create]

  def new
    @slot = @event.slots.new
  end

  def edit
  end

  def create
    @slot = @event.slots.new(slot_params)

    respond_to do |format|
      if @slot.save
        format.html { redirect_to admin_events_path, notice: 'Slot was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @slot.update(slot_params)
        format.html { redirect_to admin_events_path, notice: 'Slot was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @slot.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Slot was successfully destroyed.' }
    end
  end

  private
    def set_slot
      @slot = Slot.find(params[:id])
    end

    def set_event
      @event = Event.find(params[:event_id])
    end

    def slot_params
      params.require(:slot).permit(
        :product_id,
        :order_line_id
        )
    end
end
