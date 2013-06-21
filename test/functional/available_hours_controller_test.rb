require 'test_helper'

class AvailableHoursControllerTest < ActionController::TestCase
  setup do
    @available_hour = available_hours(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:available_hours)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create available_hour" do
    assert_difference('AvailableHour.count') do
      post :create, available_hour: { friday_from: @available_hour.friday_from, friday_to: @available_hour.friday_to, monday_from: @available_hour.monday_from, monday_to: @available_hour.monday_to, profile_id: @available_hour.profile_id, saturday_from: @available_hour.saturday_from, saturday_to: @available_hour.saturday_to, sunday_from: @available_hour.sunday_from, sunday_to: @available_hour.sunday_to, thursday_from: @available_hour.thursday_from, thursday_to: @available_hour.thursday_to, tuesday_from: @available_hour.tuesday_from, tuesday_to: @available_hour.tuesday_to, wednesday_from: @available_hour.wednesday_from, wednesday_to: @available_hour.wednesday_to }
    end

    assert_redirected_to available_hour_path(assigns(:available_hour))
  end

  test "should show available_hour" do
    get :show, id: @available_hour
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @available_hour
    assert_response :success
  end

  test "should update available_hour" do
    put :update, id: @available_hour, available_hour: { friday_from: @available_hour.friday_from, friday_to: @available_hour.friday_to, monday_from: @available_hour.monday_from, monday_to: @available_hour.monday_to, profile_id: @available_hour.profile_id, saturday_from: @available_hour.saturday_from, saturday_to: @available_hour.saturday_to, sunday_from: @available_hour.sunday_from, sunday_to: @available_hour.sunday_to, thursday_from: @available_hour.thursday_from, thursday_to: @available_hour.thursday_to, tuesday_from: @available_hour.tuesday_from, tuesday_to: @available_hour.tuesday_to, wednesday_from: @available_hour.wednesday_from, wednesday_to: @available_hour.wednesday_to }
    assert_redirected_to available_hour_path(assigns(:available_hour))
  end

  test "should destroy available_hour" do
    assert_difference('AvailableHour.count', -1) do
      delete :destroy, id: @available_hour
    end

    assert_redirected_to available_hours_path
  end
end
