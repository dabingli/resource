require 'test_helper'

class FacePricesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
