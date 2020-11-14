require "application_system_test_case"

class DataPagesTest < ApplicationSystemTestCase
  setup do
    @data_page = data_pages(:one)
  end

  test "visiting the index" do
    visit data_pages_url
    assert_selector "h1", text: "Data Pages"
  end

  test "creating a Data page" do
    visit data_pages_url
    click_on "New Data Page"

    fill_in "Data", with: @data_page.data
    click_on "Create Data page"

    assert_text "Data page was successfully created"
    click_on "Back"
  end

  test "updating a Data page" do
    visit data_pages_url
    click_on "Edit", match: :first

    fill_in "Data", with: @data_page.data
    click_on "Update Data page"

    assert_text "Data page was successfully updated"
    click_on "Back"
  end

  test "destroying a Data page" do
    visit data_pages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data page was successfully destroyed"
  end
end
