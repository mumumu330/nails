require 'rails_helper'

RSpec.describe "PostImages", type: :system do
  describe '投稿のテスト' do
    let(:user){FactoryBot.create(:user)}
    let(:post_image){FactoryBot.create(:post_image, user: user)}
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    describe '新規投稿のテスト' do
      context '新規投稿ページへ遷移' do
        it '遷移する' do
          click_on '新規投稿'
          expect(page).to have_content "新規投稿"
          expect(current_path).to eq new_post_image_path
        end
      end
      context '表示の確認' do
        before do
          visit new_post_image_path
        end
        it '画像フォームが表示される' do
          expect(page).to have_field 'post_image[image]'
        end
        it 'タグフォームが表示される' do
          expect(page).to have_field 'post_image[tag_list]'
        end
        it '投稿本文フォームが表示される' do
          expect(page).to have_field 'post_image[caption]'
        end
        it '投稿ボタンが表示される' do
          expect(page).to have_button '送信'
        end
      end
      context '投稿の成否' do
        before do
          visit new_post_image_path
        end
        it '投稿に成功する' do
          fill_in 'post_image[tag_list]', with: "test_tag" 
          fill_in 'post_image[caption]', with: "test_caption" 
          click_button "送信" 
          expect(page).to have_content "投稿一覧" 
        end
      end
    end

    # pending "add some scenarios (or delete) #{__FILE__}"
  end
end
