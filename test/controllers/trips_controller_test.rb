require 'test_helper'

class TripsControllerTest < ActionController::TestCase
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trips)
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post :create, trip: { destination: @trip.destination, enddate: @trip.enddate, start_date: @trip.start_date }
    end

    assert_response 201
  end

  test "should show trip" do
    get :show, id: @trip
    assert_response :success
  end

  test "should update trip" do
    put :update, id: @trip, trip: { destination: @trip.destination, enddate: @trip.enddate, start_date: @trip.start_date }
    assert_response 204
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete :destroy, id: @trip
    end

    assert_response 204
  end
end
