require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end



# require 'test_helper'
#
# class UserControllerTest < ActionController::TestCase
#   test "should get name" do
#     get :name
#     assert_response :success
#   end
#
#   test "should get email" do
#     get :email
#     assert_response :success
#   end
#
# end
