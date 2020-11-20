require 'rails_helper'

RSpec.describe "Users", type: :system do
  # let(:user){FactoryBot.create(:user)}
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end

      it '新規登録に成功する' do
        fill_in '名前', with: "テスト"
        fill_in 'メールアドレス', with: "test3@test3"
        fill_in 'パスワード', with: "tttttt"
        fill_in '確認用パスワード', with: "tttttt"
        click_button '新規登録'
        expect(page).to have_content 'a'
      end
    end
  end
end
