require 'test_helper'

class TellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teller = tellers(:one)
  end

  test "should get index" do
    get tellers_url
    assert_response :success
  end

  test "should get new" do
    get new_teller_url
    assert_response :success
  end

  test "should create teller" do
    assert_difference('Teller.count') do
      post tellers_url, params: { teller: { cash_in: @teller.cash_in, cash_out: @teller.cash_out, company_id: @teller.company_id, country_id: @teller.country_id, date: @teller.date, opening: @teller.opening, user_id: @teller.user_id } }
    end

    assert_redirected_to teller_url(Teller.last)
  end

  test "should show teller" do
    get teller_url(@teller)
    assert_response :success
  end

  test "should get edit" do
    get edit_teller_url(@teller)
    assert_response :success
  end

  test "should update teller" do
    patch teller_url(@teller), params: { teller: { cash_in: @teller.cash_in, cash_out: @teller.cash_out, company_id: @teller.company_id, country_id: @teller.country_id, date: @teller.date, opening: @teller.opening, user_id: @teller.user_id } }
    assert_redirected_to teller_url(@teller)
  end

  test "should destroy teller" do
    assert_difference('Teller.count', -1) do
      delete teller_url(@teller)
    end

    assert_redirected_to tellers_url
  end
end
