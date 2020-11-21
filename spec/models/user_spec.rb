require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  describe "バリデーションのテスト" do
    it "名がなければ無効な状態であること" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("can't be blank")
    end

    it "名が10文字以下でなければ無効な状態であること" do
      @user.name = "aaaaaaaaaaaaaaaaaaaaaaaaa"
      @user.valid?
      expect(@user.errors[:name]).to include("is too long (maximum is 10 characters)")
    end

    it "メールアドレスがなければ無効な状態であること" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it "パスワードが6文字以上でなければ無効であること" do
      @user.password = "a" * 5
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    # it "重複したメールアドレスなら無効な状態であること" do
    #   FactoryBot.create(:user)
    #   @user.valid?
    #   expect(@user.errors[:email]).to include("already been taken")
    # end

  end
end
