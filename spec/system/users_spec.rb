require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user){FactoryBot.create(:user)}
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

      it '新規登録に失敗する' do
        fill_in 'user[name]', with: ""
        fill_in 'user[email]', with: ""
        fill_in 'user[password]', with: ""
        fill_in 'user[password_confirmation]', with:""
        click_button '新規登録'
        expect(page).to have_content 'errors prohibited this user from being saved'
      end
    end
  end

  describe 'ユーザーログイン' do
    before do
      visit new_user_session_path
    end

    context 'ログイン画面に遷移' do
      it 'ログインに成功する' do
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
        expect(page).to have_content 'Signed in successfully.'
      end

      it 'ログインに失敗する' do
        fill_in 'user[email]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'ユーザーのテスト' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe 'マイページのテスト' do
      it 'ヘッダーにマイページと表示される' do
        expect(page).to have_content('マイページ')
      end

      it 'マイページに遷移し編集リンクが表示される' do
        visit user_path(user)
        expect(page).to have_content('プロフィール編集')
      end
    end

    describe '編集のテスト' do
      context '編集画面へ遷移' do
        it '遷移ができる' do
          visit edit_user_path(user)
          expect(current_path).to eq edit_user_path(user)
        end
      end

      context '表示の確認と編集' do
        before do
          visit edit_user_path(user)
        end

        it '画像編集フォームが表示される' do
          expect(page).to have_field 'user[profile_image]'
        end

        it '名前編集フォームに自分の名前が表示される' do
          expect(page).to have_field 'user[name]', with: user.name
        end
      end
    end
  end

end
