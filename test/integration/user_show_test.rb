require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @inactive_user  = users(:inactive)  # 未承認ユーザー
    @activated_user = users(:archer)    # 承認済みユーザー
  end

  test 'should redirect when user not activated' do
    get user_path(@inactive_user)
    assert_response :redirect # 302 リダイレクトを確認
    assert_redirected_to root_url # ルートページにリダイレクトされることを確認
  end

  test 'should display user when activated' do
    get user_path(@activated_user)
    assert_response :success # 200 OK を確認
    assert_template 'users/show' # users/show テンプレートが表示されることを確認
  end
end
