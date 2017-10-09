require 'test_helper'

class MoneyControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get calc" do
    get :calc
    assert_response :success
  end

end
