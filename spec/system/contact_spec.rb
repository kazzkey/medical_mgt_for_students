require 'rails_helper'

RSpec.describe '投稿機能', type: :system do

  before do
    FactoryBot.create(:user_student)
  end

  describe '試験一覧画面' do
    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      contact = FactoryBot.create(:contact)
    end

    context '1件の投稿があった場合' do
      it '投稿が1つ表示されている' do
        visit contacts_path
        expect(page).to have_content '山田花子'
        expect(page).to have_content 'TestTitle'
        expect( Contact.count ).to eq 1
      end
    end
  end

  describe '投稿作成画面' do
    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '項目をすべて入力して作成した場合' do
      before do
        visit contacts_path
        click_on 'New contact'
        fill_in 'Title', with: 'TestContact'
        fill_in 'Content', with: 'Hi, this is test.'
        click_on '送信'
      end

      it 'データが保存されている' do
        visit contacts_path
        expect(page).to have_content '山田花子'
        expect(page).to have_content 'TestContact'
        expect(page).to have_content 'Hi, this is ...'
      end
    end
  end

  describe '投稿詳細画面' do
    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '任意の投稿詳細画面にアクセスした場合' do
      it '該当の内容が表示されたページに遷移する' do
        FactoryBot.create(:contact)
        visit contacts_path
        click_on 'Show'
        sleep 0.5
        expect(page).to have_content '山田花子'
        expect(page).to have_content 'TestTitle'
        expect(page).to have_content 'Hey, this is a test.'
        expect(page).to have_content '非公開'
      end
    end
  end

  describe '投稿編集画面' do
    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
    end

    context '投稿の公開にチェックをした場合' do
      it '公開情報が変更される' do
        FactoryBot.create(:contact)
        visit contacts_path
        click_on 'Edit'
        sleep 0.5
        find(".custom-control-label").click
        click_on '送信'
        sleep 0.5
        click_on 'Show'
        expect(page).to have_content '公開中'
      end
    end
  end

  describe '投稿削除画面' do
    before do
      visit new_user_student_session_path
      fill_in 'Eメール', with: 'yamada@example.com'
      fill_in 'パスワード', with: 'password'
      click_button 'ログイン'
      FactoryBot.create(:contact)
    end

    context '投稿を削除した場合' do
      it '削除された投稿は存在しなくなる' do
        visit contacts_path
        click_on 'Destroy'
        page.driver.browser.switch_to.alert.accept
        sleep 0.5
        expect(page).not_to have_content 'TestContact'
        expect( Contact.count ).to eq 0
      end
    end
  end
end
