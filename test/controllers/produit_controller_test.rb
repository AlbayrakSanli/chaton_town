require 'test_helper'

class ProduitControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get produit_index_url
    assert_response :success
  end

end
