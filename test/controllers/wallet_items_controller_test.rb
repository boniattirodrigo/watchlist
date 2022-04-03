require "test_helper"

class WalletItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wallet_item = wallet_items(:one)
  end

  test "should create wallet_item" do
    assert_difference("WalletItem.count") do
      post wallet_items_url, params: { wallet_item: { wallet_id: @wallet_item.wallet_id } }
    end

    assert_redirected_to wallet_item_url(WalletItem.last)
  end

  test "should destroy wallet_item" do
    assert_difference("WalletItem.count", -1) do
      delete wallet_item_url(@wallet_item)
    end

    assert_redirected_to wallet_items_url
  end
end
