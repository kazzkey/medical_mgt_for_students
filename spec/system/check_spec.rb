require 'rails_helper'

RSpec.describe '定期診断機能', type: :system do

  before do
    FactoryBot.create(:user_officer)
    FactoryBot.create(:user_student)
  end

  describe '定期診断入力画面' do

    before do
      visit new_user_officer_session_path
      fill_in 'Eメール', with: 'yamamoto@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '診断結果を作成した場合' do

      it 'データが保存されている' do
        visit checks_path
        click_on 'New contact'
        all('select')[0].select('山田花子')
        all('select')[1].select('1')
        fill_in '身長', with: '160'
        fill_in '体重', with: '40'
        fill_in '座高', with: '70'
        fill_in '裸眼視力', with: '1.0'
        select 'よく聞こえている', from: '聴力'
        click_on '送信'
        sleep 0.5
        expect(page).to have_content '山田花子'
        click_on 'Show'
        expect(page).to have_content '160'
        expect(page).to have_content '40'
        expect(page).to have_content '70'
        expect(page).to have_content '1.0'
        expect(page).to have_content 'よく聞こえている'
      end
    end
  end
end
