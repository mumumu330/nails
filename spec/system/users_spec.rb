require 'rails_helper'

RSpec.describe "Users", type: :system do
  # let(:user){FactoryBot.create(:user)}
  describe 'ユーザー認証のテスト' do
    describe 'ユーザー新規登録' do
      before do
        visit new_user_registration_path
      end

      it '新規登録に成功する' do
        fill_in 'user[name]', with: "テスト"
        fill_in 'user[email]', with: "test2@test2"
        fill_in 'user[password]', with: "tttttt"
        fill_in 'user[password_confirmation]', with: "tttttt"
        click_button '新規登録'
        expect(page).to have_content 'signed up successfully'
      end
    end
  end
end
