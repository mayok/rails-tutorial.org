require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path

    # 無効な情報では User.count に変化がないことをテストする
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "foo",
                               password_confirmation: "bar" }
    end

    # アカウント作成に失敗したら、users/new が描画されるかテストする
    assert_template 'users/new'
  end
end
