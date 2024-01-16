# app/controllers/plays_controller.rb

class PlaysController < ApplicationController
  before_action :set_parent, only: [:new, :create, :consent_agreed]
  before_action :set_play, only: [:show, :edit, :update, :destroy]

  def index
    @plays = Play.all
  end

  def show
    @play = Play.find(params[:id])
  end

  def new
    @parent = Parent.find(params[:parent_id])
    @play = Play.new
  end

  def create
    @play = @parent.plays.new(play_params)

    # Set start_time to the current time if not provided
    @play.start_time ||= Time.now

    # if params[:play][:open_time] == '1'
    if @play.open_time == true
      # If open_time is selected, set number_of_hours and end_time to nil
      @play.number_of_hours = nil
      @play.end_time = nil
    else
      # If open_time is not selected, set number_of_hours and calculate end_time
      @play.end_time ||= @play.start_time + @play.number_of_hours.hours if @play.number_of_hours.present?
    end

    if @play.save
      redirect_to thank_you_path, notice: 'Play was successfully created.'
    else
      render :new
    end
  end

  def edit
    @play = Play.find(params[:id])
  end

  def update
    @play = Play.find(params[:id])
    @play.end_time = Time.now
    @play.number_of_hours = ((@play.end_time - @play.start_time) / 1.hour).round(2)
    @play.save
    if @play.update(play_params)
      redirect_to play_path(@play), notice: 'Play was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @play.destroy
    redirect_to parent_plays_path(@parent), notice: 'Play was successfully destroyed.'
  end

  def sales_report
    @plays = Play.all
    @total_sales = @plays.sum(:price)
    @total_hours = @plays.sum(:number_of_hours)
    @total_kids = @plays.sum(:number_of_kids)

    @total_sales_today = @plays.where('created_at >= ?', Time.zone.now.beginning_of_day).sum(:price)
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_play
    @play = Play.find(params[:id])
  end

  def play_params
    params.require(:play).permit(:number_of_kids, :number_of_hours, :start_time, :end_time, :open_time, :price, :name, :parent_id)
  end
end
