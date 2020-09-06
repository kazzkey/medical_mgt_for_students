require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    FactoryBot.create(:user_student)
    FactoryBot.create(:contact)
  end

  it 'コメントが入力されている場合、有効である' do
    comment = Comment.new(
      content: 'test',
      user_student_id: 1,
      contact_id: 1,
    )
    expect(comment).to be_valid
  end

  it 'コメントが入力されていない場合、無効である' do
    comment = Comment.new(
      content: nil,
      user_student_id: 1,
      contact_id: 1,
    )
    expect(comment).to be_invalid
  end
end
