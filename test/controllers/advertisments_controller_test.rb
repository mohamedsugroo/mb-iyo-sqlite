require 'test_helper'

class AdvertismentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advertisment = advertisments(:one)
  end

  test "should get index" do
    get advertisments_url
    assert_response :success
  end

  test "should get new" do
    get new_advertisment_url
    assert_response :success
  end

  test "should create advertisment" do
    assert_difference('Advertisment.count') do
      post advertisments_url, params: { advertisment: { code_css: @advertisment.code_css, code_html: @advertisment.code_html, code_js: @advertisment.code_js, comany_name: @advertisment.comany_name, end_date: @advertisment.end_date, start_date: @advertisment.start_date, title: @advertisment.title } }
    end

    assert_redirected_to advertisment_url(Advertisment.last)
  end

  test "should show advertisment" do
    get advertisment_url(@advertisment)
    assert_response :success
  end

  test "should get edit" do
    get edit_advertisment_url(@advertisment)
    assert_response :success
  end

  test "should update advertisment" do
    patch advertisment_url(@advertisment), params: { advertisment: { code_css: @advertisment.code_css, code_html: @advertisment.code_html, code_js: @advertisment.code_js, comany_name: @advertisment.comany_name, end_date: @advertisment.end_date, start_date: @advertisment.start_date, title: @advertisment.title } }
    assert_redirected_to advertisment_url(@advertisment)
  end

  test "should destroy advertisment" do
    assert_difference('Advertisment.count', -1) do
      delete advertisment_url(@advertisment)
    end

    assert_redirected_to advertisments_url
  end
end
