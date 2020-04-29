require "application_system_test_case"

class TellersTest < ApplicationSystemTestCase
  setup do
    @teller = tellers(:one)
  end

  test "visiting the index" do
    visit tellers_url
    assert_selector "h1", text: "Tellers"
  end

  test "creating a Teller" do
    visit tellers_url
    click_on "New Teller"

    fill_in "Cash in", with: @teller.cash_in
    fill_in "Cash out", with: @teller.cash_out
    fill_in "Company", with: @teller.company_id
    fill_in "Country", with: @teller.country_id
    fill_in "Date", with: @teller.date
    fill_in "Opening", with: @teller.opening
    fill_in "User", with: @teller.user_id
    click_on "Create Teller"

    assert_text "Teller was successfully created"
    click_on "Back"
  end

  test "updating a Teller" do
    visit tellers_url
    click_on "Edit", match: :first

    fill_in "Cash in", with: @teller.cash_in
    fill_in "Cash out", with: @teller.cash_out
    fill_in "Company", with: @teller.company_id
    fill_in "Country", with: @teller.country_id
    fill_in "Date", with: @teller.date
    fill_in "Opening", with: @teller.opening
    fill_in "User", with: @teller.user_id
    click_on "Update Teller"

    assert_text "Teller was successfully updated"
    click_on "Back"
  end

  test "destroying a Teller" do
    visit tellers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Teller was successfully destroyed"
  end
end
