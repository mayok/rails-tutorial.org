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

  test "valid signup information" do
    get signup_path
    # 有効な情報では User.count が 1 変わることをテストする
    assert_difference 'User.count', 1 do
      # post したあとのリダイレクトにも追従する
      post_via_redirect users_path, user: { name: "Example User",
                                            email: "user@example.com",
                                            password: "foobar",
                                            password_confirmation: "foobar" }
    end

    # アカウント作成に成功したら、users/show が描画されるかテストする
    assert_template 'users/show'
  end
end
