require "test_helper"

class SpdmUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spdm_user = spdm_users(:one)
  end

  test "should get index" do
    get spdm_users_url
    assert_response :success
  end

  test "should get new" do
    get new_spdm_user_url
    assert_response :success
  end

  test "should create spdm_user" do
    assert_difference("SpdmUser.count") do
      post spdm_users_url, params: { spdm_user: { email: @spdm_user.email, first_name: @spdm_user.first_name, last_name: @spdm_user.last_name, phone: @spdm_user.phone, twitter: @spdm_user.twitter } }
    end

    assert_redirected_to spdm_user_url(SpdmUser.last)
  end

  test "should show spdm_user" do
    get spdm_user_url(@spdm_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_spdm_user_url(@spdm_user)
    assert_response :success
  end

  test "should update spdm_user" do
    patch spdm_user_url(@spdm_user), params: { spdm_user: { email: @spdm_user.email, first_name: @spdm_user.first_name, last_name: @spdm_user.last_name, phone: @spdm_user.phone, twitter: @spdm_user.twitter } }
    assert_redirected_to spdm_user_url(@spdm_user)
  end

  test "should destroy spdm_user" do
    assert_difference("SpdmUser.count", -1) do
      delete spdm_user_url(@spdm_user)
    end

    assert_redirected_to spdm_users_url
  end
end
