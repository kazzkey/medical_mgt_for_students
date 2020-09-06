require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do

  before do
    FactoryBot.create(:user_student)
    FactoryBot.create(:contact, release: true)
  end

  describe 'コメント画面' do

    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '自分のコメントを送信した場合' do

      before do
        visit contact_path(id: 1)
        sleep 0.5
        fill_in 'Content', with: 'TestComment'
        click_on 'Create Comment'
      end

      it '自分のコメントがページに反映される' do
        visit contact_path(id: 1)
        expect(page).to have_content 'TestComment'
      end

      it '自分のコメントを編集できる' do
        visit contact_path(id: 1)
        sleep 0.5
        click_link 'コメント編集'
        sleep 0.5
        first('textarea').set('ExampleComment')
        click_on 'Update Comment'
        expect(page).to have_content 'ExampleComment'
      end

      it '自分のコメントを削除できる' do
        visit contact_path(id: 1)
        sleep 0.5
        click_link 'コメント削除'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).not_to have_content 'TestComment'
      end
    end
  end
end
