require "application_system_test_case"

class BoardUsersTest < ApplicationSystemTestCase
  setup do
    @board_user = board_users(:one)
  end

  test "visiting the index" do
    visit board_users_url
    assert_selector "h1", text: "Board Users"
  end

  test "creating a Board user" do
    visit board_users_url
    click_on "New Board User"

    fill_in "Account", with: @board_user.account_id
    fill_in "Memo", with: @board_user.memo
    fill_in "Nickname", with: @board_user.nickname
    click_on "Create Board user"

    assert_text "Board user was successfully created"
    click_on "Back"
  end

  test "updating a Board user" do
    visit board_users_url
    click_on "Edit", match: :first

    fill_in "Account", with: @board_user.account_id
    fill_in "Memo", with: @board_user.memo
    fill_in "Nickname", with: @board_user.nickname
    click_on "Update Board user"

    assert_text "Board user was successfully updated"
    click_on "Back"
  end

  test "destroying a Board user" do
    visit board_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Board user was successfully destroyed"
  end
end
