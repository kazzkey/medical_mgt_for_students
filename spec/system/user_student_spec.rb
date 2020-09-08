require 'rails_helper'

RSpec.describe 'ユーザ管理機能', type: :system do

  before do
    FactoryBot.create(:user_student)
  end

  describe 'ユーザ詳細画面' do
    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context 'マイページにアクセスした場合' do

      it 'ユーザ情報が表示される' do
        visit root_path
        click_link 'プロフィール', match: :first
        expect(page).to have_content '山田花子'
        expect(page).to have_content 'yamada@example.com'
        expect(page).to have_content '202020'
        expect(page).to have_content '2002-01-01'
        expect(page).to have_content '小学2年生'
        expect(page).to have_content 'O型'
      end
    end

    context 'メールアドレスを編集した場合' do
      it '情報が更新される' do
        visit root_path
        click_link 'プロフィール', match: :first
        click_link '編集'
        sleep 0.5
        fill_in 'Eメール', with: 'hanako@example.com'
        fill_in '現在のパスワード', with: 'password'
        click_on '更新'
        sleep 0.5
        click_link 'プロフィール', match: :first
        expect(page).to have_content 'hanako@example.com'
      end
    end
  end
end
