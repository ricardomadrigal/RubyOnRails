require "application_system_test_case"

class SpdmUsersTest < ApplicationSystemTestCase
  setup do
    @spdm_user = spdm_users(:one)
  end

  test "visiting the index" do
    visit spdm_users_url
    assert_selector "h1", text: "Spdm users"
  end

  test "should create spdm user" do
    visit spdm_users_url
    click_on "New spdm user"

    fill_in "Email", with: @spdm_user.email
    fill_in "First name", with: @spdm_user.first_name
    fill_in "Last name", with: @spdm_user.last_name
    fill_in "Phone", with: @spdm_user.phone
    fill_in "Twitter", with: @spdm_user.twitter
    click_on "Create Spdm user"

    assert_text "Spdm user was successfully created"
    click_on "Back"
  end

  test "should update Spdm user" do
    visit spdm_user_url(@spdm_user)
    click_on "Edit this spdm user", match: :first

    fill_in "Email", with: @spdm_user.email
    fill_in "First name", with: @spdm_user.first_name
    fill_in "Last name", with: @spdm_user.last_name
    fill_in "Phone", with: @spdm_user.phone
    fill_in "Twitter", with: @spdm_user.twitter
    click_on "Update Spdm user"

    assert_text "Spdm user was successfully updated"
    click_on "Back"
  end

  test "should destroy Spdm user" do
    visit spdm_user_url(@spdm_user)
    click_on "Destroy this spdm user", match: :first

    assert_text "Spdm user was successfully destroyed"
  end
end
