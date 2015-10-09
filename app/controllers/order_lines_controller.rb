class OrderLinesController < ApplicationController
  load_and_authorize_resource :team
  load_and_authorize_resource :order_line, :through => :team

  before_filter :set_default_category, :only => [:index]

  # GET /order_lines
  # GET /order_lines.json
  def index
    @dispatched_orders = @team
    .order_lines
    .index_join
    .filter( params.slice(:status, :category, :difficulty) )
    .scheduled
    .accessible_by(current_ability)

    @completed_orders = @team
    .order_lines
    .index_join
    .filter( params.slice(:status, :category, :difficulty) )
    .where_completed  
    .accessible_by(current_ability)
    
    store_location
  end

  # GET /teams/1/sales/1
  def show
  end

  private

  def set_default_category
    if params[:category].blank?
      params[:category] = Category.by_name('raiding').id
      redirect_to url_for(params)
    end
  end
end
