require 'test_helper'

module Logs
  class RequestDataControllerTest < ActionController::TestCase
    setup do
      @request_datum = request_data(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:request_data)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create request_datum" do
      assert_difference('RequestDatum.count') do
        post :create, request_datum: { host: @request_datum.host, method: @request_datum.method, port: @request_datum.port, user_agent: @request_datum.user_agent }
      end

      assert_redirected_to request_datum_path(assigns(:request_datum))
    end

    test "should show request_datum" do
      get :show, id: @request_datum
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @request_datum
      assert_response :success
    end

    test "should update request_datum" do
      patch :update, id: @request_datum, request_datum: { host: @request_datum.host, method: @request_datum.method, port: @request_datum.port, user_agent: @request_datum.user_agent }
      assert_redirected_to request_datum_path(assigns(:request_datum))
    end

    test "should destroy request_datum" do
      assert_difference('RequestDatum.count', -1) do
        delete :destroy, id: @request_datum
      end

      assert_redirected_to request_data_path
    end
  end
end
