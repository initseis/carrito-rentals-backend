require 'test_helper'

class V1::CarsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get v1_cars_index_url
    assert_response :success
  end

  test 'should get show' do
    get v1_cars_show_url
    assert_response :success
  end

  test 'should get new' do
    get v1_cars_new_url
    assert_response :success
  end

  test 'should get create' do
    get v1_cars_create_url
    assert_response :success
  end
end
