# app/controllers/parents_controller.rb

class ParentsController < ApplicationController
  before_action :authenticate_user!, except: [:welcome]
  before_action :set_parent, only: [:show, :edit, :update, :destroy, :consent]

  def index
    @parents = Parent.all
  end

  def show
  end

  def new
    if Rate.last.nil?
      redirect_to new_rate_path, alert: 'Please create a rate before creating a parent.'
    end
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    @parent.name = @parent.name.titleize
    if @parent.save
      redirect_to new_parent_play_path(@parent), notice: 'Parent was successfully created.'
    else
      redirect_to new_parent_path, alert: 'Error creating parent. Please try again.'

    end
  end


  def edit
  end

  def update
    if @parent.update(parent_params)
      redirect_to parent_path(@parent), notice: 'Parent was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @parent.destroy
    redirect_to welcome_path, notice: 'Parent was successfully destroyed.'
  end

  def consent
    # Render a consent form view
  end

  def thank_you
    # Render a thank you view
  end

  def welcome
    # Render a thank you view
  end

  private

  def set_parent
    @parent = Parent.find(params[:id])
  end

  def parent_params
    params.require(:parent).permit(:name, :consent_agreed, :control_number)
  end
end
