require 'rails_helper'

RSpec.describe 'メモ機能', type: :system do

  before do
    FactoryBot.create(:user_officer)
  end

  describe 'コメント画面' do

    before do
      visit new_user_officer_session_path
      fill_in 'Eメール', with: 'yamamoto@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context 'メモを作成した場合' do

      it 'データが保存されている' do
        visit memos_path
        click_on '新規作成'
        find('div[contenteditable]').send_keys('This is memo!!')
        click_on '送信'
        sleep 0.5
        expect(page).to have_content 'This is memo!!'
      end
    end
  end
end
