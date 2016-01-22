class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]
  before_action :authenticate_with_token!
  before_action :is_authorized?, except: [:create]

  def index
    head :unauthorized unless current_user.admin?
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end

  def create
    params[:trip][:user_id] = current_user.id unless current_user.admin? and trip_params[:user_id].present?
    @trip = Trip.new(trip_params)
    if @trip.save
      render json: @trip, status: :created, location: @trip
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      head :no_content
    else
      render json: @trip.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @trip.destroy
    head :no_content
  end

  private

    def set_trip
      @trip = Trip.find(params[:id])
    end

    def trip_params
      params.require(:trip).permit(:destination, :start_date, :enddate, :user_id)
    end

    def is_authorized?
      head :unauthorized unless current_user.admin?  || (current_user.trips.include? @trip)
    end

end
