require 'rails_helper'

RSpec.describe UserOfficer, type: :model do
  it '入力欄が全て正しく入力されていれば、有効である(医師)' do
    user_officer = UserOfficer.new(
      id: 1,
      name: '鈴木一郎',
      type: '医師',
      email: 'suzuki@example.com',
      password: 'password',
    )
    expect(user_officer).to be_valid
  end

  it '入力欄が全て正しく入力されていれば、有効である(教師)' do
    user_officer = UserOfficer.new(
      id: 1,
      name: '佐藤としお',
      type: '教師',
      email: 'satou@example.com',
      password: 'password',
    )
    expect(user_officer).to be_valid
  end

  it '名前がない場合、無効である' do
    user_officer = UserOfficer.new(
      id: 1,
      name: nil,
      type: '医師',
      email: 'tanaka@example.com',
      password: 'password',
    )
    expect(user_officer).to be_invalid
  end

  it 'メールアドレスがない場合、無効である' do
    user_officer = UserOfficer.new(
      id: 1,
      name: '田中たろう',
      type: '医師',
      email: nil,
      password: 'password',
    )
    expect(user_officer).to be_invalid
  end

  it '職種がない場合、無効である' do
    user_officer = UserOfficer.new(
      id: 1,
      name: '鈴木一郎',
      type: nil,
      email: 'tanaka@example.com',
      password: 'password',
    )
    expect(user_officer).to be_invalid
  end

  it 'パスワードがない場合、無効である' do
    user_officer = UserOfficer.new(
      id: 1,
      name: '田中たろう',
      type: '医師',
      email: 'tanaka@example.com',
      password: nil,
    )
    expect(user_officer).to be_invalid
  end
end
