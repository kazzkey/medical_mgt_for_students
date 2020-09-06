require 'rails_helper'

RSpec.describe Contact, type: :model do

  it '全て正しく入力されていれば、有効である' do
    contact = Contact.new(
      title: 'Test',
      content: 'こんにちは、テストです。',
      release: false,
    )
    expect(contact).to be_valid
  end

  it 'タイトルがない場合、無効である' do
    contact = Contact.new(
      title: nil,
      content: 'こんにちは、テストです。',
      release: false,
    )
    expect(contact).to be_invalid
  end

  it '内容がない場合、無効である' do
    contact = Contact.new(
      title: 'Test',
      content: nil,
      release: false,
    )
    expect(contact).to be_invalid
  end

  it '公開は未入力でも、デフォルトでfalseが入り、有効である' do
    contact = Contact.new(
      title: 'Test',
      content: 'こんにちは、テストです。',
      release: nil,
    )
    expect(contact).to be_valid
  end
end
