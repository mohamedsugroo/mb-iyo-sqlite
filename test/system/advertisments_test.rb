require "application_system_test_case"

class AdvertismentsTest < ApplicationSystemTestCase
  setup do
    @advertisment = advertisments(:one)
  end

  test "visiting the index" do
    visit advertisments_url
    assert_selector "h1", text: "Advertisments"
  end

  test "creating a Advertisment" do
    visit advertisments_url
    click_on "New Advertisment"

    fill_in "Code Css", with: @advertisment.code_css
    fill_in "Code Html", with: @advertisment.code_html
    fill_in "Code Js", with: @advertisment.code_js
    fill_in "Comany Name", with: @advertisment.comany_name
    fill_in "End Date", with: @advertisment.end_date
    fill_in "Start Date", with: @advertisment.start_date
    fill_in "Title", with: @advertisment.title
    click_on "Create Advertisment"

    assert_text "Advertisment was successfully created"
    click_on "Back"
  end

  test "updating a Advertisment" do
    visit advertisments_url
    click_on "Edit", match: :first

    fill_in "Code Css", with: @advertisment.code_css
    fill_in "Code Html", with: @advertisment.code_html
    fill_in "Code Js", with: @advertisment.code_js
    fill_in "Comany Name", with: @advertisment.comany_name
    fill_in "End Date", with: @advertisment.end_date
    fill_in "Start Date", with: @advertisment.start_date
    fill_in "Title", with: @advertisment.title
    click_on "Update Advertisment"

    assert_text "Advertisment was successfully updated"
    click_on "Back"
  end

  test "destroying a Advertisment" do
    visit advertisments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Advertisment was successfully destroyed"
  end
end
