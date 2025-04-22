require 'rails_helper'

RSpec.describe "UserSessions", type: :system do
  include LoginMacros

  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }

  describe "ログイン前" do
    context "フォームの入力値が正常" do
      it "ログイン処理が成功する" do
        visit login_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "password"
        click_button "ログイン"
        expect(page).to have_content "ログインしました"
        expect(current_path).to eq root_path
      end
    end

    context "フォームが未入力" do
      it "ログイン処理が失敗する" do
        visit login_path
        fill_in "email", with: ""
        fill_in "password", with: "password"
        click_button "ログイン"
        expect(page).to have_content "ログインに失敗しました"
        expect(current_path).to eq login_path
      end
    end

  end
end
